#include "http.h"
#include "tcp.h"
#include "net.h"
#include "assert.h"

#define TCP_FIFO_SIZE 40

typedef struct http_fifo {
    tcp_connect_t* buffer[TCP_FIFO_SIZE];
    uint8_t front, tail, count;
} http_fifo_t;

static http_fifo_t http_fifo_v;

static void http_fifo_init(http_fifo_t* fifo) {
    fifo->count = 0;
    fifo->front = 0;
    fifo->tail = 0;
}

static int http_fifo_in(http_fifo_t* fifo, tcp_connect_t* tcp) {
    if (fifo->count >= TCP_FIFO_SIZE) {
        return -1;
    }
    fifo->buffer[fifo->front] = tcp;
    fifo->front++;
    if (fifo->front >= TCP_FIFO_SIZE) {
        fifo->front = 0;
    }
    fifo->count++;
    return 0;
}

static tcp_connect_t* http_fifo_out(http_fifo_t* fifo) {
    if (fifo->count == 0) {
        return NULL;
    }
    tcp_connect_t* tcp = fifo->buffer[fifo->tail];
    fifo->tail++;
    if (fifo->tail >= TCP_FIFO_SIZE) {
        fifo->tail = 0;
    }
    fifo->count--;
    return tcp;
}

static size_t get_line(tcp_connect_t* tcp, char* buf, size_t size) {
    size_t i = 0;
    while (i < size) {
        char c;
        if (tcp_connect_read(tcp, (uint8_t*)&c, 1) > 0) {
            if (c == '\n') {
                break;
            }
            if (c != '\n' && c != '\r') {
                buf[i] = c;
                i++;
            }
        }
        net_poll();
    }
    buf[i] = '\0';
    return i;
}

static size_t http_send(tcp_connect_t* tcp, const char* buf, size_t size) {
    size_t send = 0;
    while (send < size) {
        send += tcp_connect_write(tcp, (const uint8_t*)buf + send, size - send);
        net_poll();
    }
    return send;
}

static void close_http(tcp_connect_t* tcp) {
    tcp_connect_close(tcp);
    printf("http closed.\n");
}



static void send_file(tcp_connect_t* tcp, const char* url) {
    FILE* file;
    uint32_t size;
    // const char* content_type = "text/html";
    char file_path[255];
    char tx_buffer[1024];

    /*
    解析url路径，查看是否是查看XHTTP_DOC_DIR目录下的文件
    如果不是，则发送404 NOT FOUND
    如果是，则用HTTP/1.0协议发送

    注意，本实验的WEB服务器网页存放在XHTTP_DOC_DIR目录中
    */
    // TODO

    // 解析url路径
    memcpy(file_path, XHTTP_DOC_DIR, sizeof(XHTTP_DOC_DIR));

    // path中只有'/'，默认为index.html
    // url可能的其他取值 /imagex.jpg   /page1.html   /404.html
    // printf("%s\n",url);
    if(strlen(url) == 1){
        strcat(file_path, "/index.html");
    }else{
        strcat(file_path, url);
    }
    // 二进制方法打开文件
    file = fopen(file_path, "rb");  

    // 填写http响应消息
    // 文件不存在XHTTP_DOC_DIR目录下，发送404 NOT FOUND
    if(file == NULL){
        // 首部行
        // 状态行
        sprintf(tx_buffer, "HTTP/1.0 404 Not Found\r\n");
        http_send(tcp, tx_buffer, strlen(tx_buffer));
        // 提供服务者缺省
        sprintf(tx_buffer, "Sever: \r\n");  
        http_send(tcp, tx_buffer, strlen(tx_buffer));
        // sprintf(tx_buffer, "Content-Type: text/html\r\n");
        sprintf(tx_buffer, "Content-Type: \r\n");
        http_send(tcp, tx_buffer, strlen(tx_buffer));
        sprintf(tx_buffer, "\r\n");
        http_send(tcp, tx_buffer, strlen(tx_buffer));
    }
    
    // 文件存在XHTTP_DOC_DIR目录下
    else{
        // 首部行
        // 状态行
        sprintf(tx_buffer, "HTTP/1.0 200 OK\r\n");
        http_send(tcp, tx_buffer, strlen(tx_buffer));
        // 提供服务者缺省
        sprintf(tx_buffer, "Sever: \r\n");  
        http_send(tcp, tx_buffer, strlen(tx_buffer));
        // 由于需要传输text与jpg直接缺省
        sprintf(tx_buffer, "Content-Type: \r\n");  
        http_send(tcp, tx_buffer, strlen(tx_buffer));
        sprintf(tx_buffer, "\r\n");
        http_send(tcp, tx_buffer, strlen(tx_buffer));

        //读取html以及jpg文件
        memset(tx_buffer, 0, sizeof(tx_buffer));
        while(fread(tx_buffer, sizeof(char), sizeof(tx_buffer), file) > 0)
        {
            http_send(tcp, tx_buffer, sizeof(tx_buffer));
            memset(tx_buffer, 0, sizeof(tx_buffer));
        }
        fclose(file);
    }

}

static void http_handler(tcp_connect_t* tcp, connect_state_t state) {
    if (state == TCP_CONN_CONNECTED) {
        http_fifo_in(&http_fifo_v, tcp);
        printf("http conntected.\n");
    } else if (state == TCP_CONN_DATA_RECV) {
    } else if (state == TCP_CONN_CLOSED) {
        printf("http closed.\n");
    } else {
        assert(0);
    }
}


// 在端口上创建服务器。

int http_server_open(uint16_t port) {
    if (!tcp_open(port, http_handler)) {
        return -1;
    }
    http_fifo_init(&http_fifo_v);
    return 0;
}

// 从FIFO取出请求并处理。新的HTTP请求时会发送到FIFO中等待处理。
void http_server_run(void) {
    tcp_connect_t* tcp;
    char url_path[255];
    char rx_buffer[1024];

    // 一直处理到FIFO队列中没有HTTP请求为止
    while ((tcp = http_fifo_out(&http_fifo_v)) != NULL) {
        int i;
        char* c = rx_buffer;

        /*
        1、调用get_line从rx_buffer中获取一行数据，如果没有数据，则调用close_http关闭tcp，并继续循环
        */
       // TODO

        size_t size = get_line(tcp, c, 1023);
        if(size == 0)
        {
            close_http(tcp);
            continue;
        }

        /*
        2、检查是否有GET请求，如果没有，则调用close_http关闭tcp，并继续循环
        */
       // TODO

        // http请求消息的指针
        i = 0;
        // 提取信息的指针
        int j = 0;

        // http请求消息第一行是GET, POST, HEAD命令的ASCII形式
        char method[10];
        // method字段，逐个复制
        while(c[i] != ' ')
            method[j++] = c[i++];
        method[j] = '\0';
        // memcpy(method, c, 3);
        // 只处理GET请求
        if(strcmp(method, "GET"))
        {
            close_http(tcp);
            continue;
        }

        /*
        3、解析GET请求的路径，注意跳过空格，找到GET请求的文件，调用send_file发送文件
        */
       // TODO

        // 跳过空格，提取信息的指针归零
        i++, j=0; 

        // URL字段，逐个复制
        while(c[i] != ' ')
            url_path[j++] = c[i++];
        // 字符串结尾
        url_path[j] = '\0';

        send_file(tcp, url_path);

        /*
        4、调用close_http关掉连接
        */
       // TODO
       
        // 一次http传输
        close_http(tcp);

        printf("!! final close\n");
    }
}
