#include "net.h"
#include "icmp.h"
#include "ip.h"

/**
 * @brief 发送icmp响应
 * 
 * @param req_buf 收到的icmp请求包
 * @param src_ip 源ip地址
 */
static void icmp_resp(buf_t *req_buf, uint8_t *src_ip)
{
    // TO-DO
    // 初始化txbuf
    buf_init(&txbuf, req_buf->len);
    // 拷贝数据
    memcpy(txbuf.data, req_buf->data, req_buf->len);

    icmp_hdr_t* req_icmp_hdr = (icmp_hdr_t *)req_buf->data;

    // 封装报头和数据
    icmp_hdr_t* hdr = (icmp_hdr_t*)txbuf.data;
    hdr->type = ICMP_TYPE_ECHO_REPLY;
    hdr->code = 0;
    hdr->id16 = req_icmp_hdr->id16;
    hdr->seq16 = req_icmp_hdr->seq16;

    // 计算校验和
    hdr->checksum16 = 0;
    hdr->checksum16 = checksum16((uint16_t *)txbuf.data, txbuf.len);

    // 发送数据报
    ip_out(&txbuf, src_ip, NET_PROTOCOL_ICMP);
}

/**
 * @brief 处理一个收到的数据包
 * 
 * @param buf 要处理的数据包
 * @param src_ip 源ip地址
 */
void icmp_in(buf_t *buf, uint8_t *src_ip)
{
    // TO-DO
    // 报头检测
    if (buf->len < sizeof(icmp_hdr_t))   return;
    icmp_hdr_t* hdr = (icmp_hdr_t *)buf->data;

    // 查看是否是回显请求（TYPE=8，CODE=0）
    if (hdr->type == ICMP_TYPE_ECHO_REQUEST && hdr->code == 0)
        icmp_resp(buf, src_ip);
}

/**
 * @brief 发送icmp不可达
 * 
 * @param recv_buf 收到的ip数据包
 * @param src_ip 源ip地址
 * @param code icmp code，协议不可达或端口不可达
 */
void icmp_unreachable(buf_t *recv_buf, uint8_t *src_ip, icmp_code_t code)
{
    // TO-DO
    // 总体结构 icmp_hdr + ip_hdr + data(8 bytes)

    // 首先复制原有部分（ip_hdr+8bytes），这样不需要显示地从接收数据包复制对应信息
    buf_init(&txbuf, sizeof(ip_hdr_t) + 8);
    memcpy(txbuf.data, recv_buf->data, sizeof(ip_hdr_t) + 8);

    // 增加icmp头部
    buf_add_header(&txbuf, sizeof(icmp_hdr_t));
    // 填写icmp头部
    icmp_hdr_t* hdr = (icmp_hdr_t*)txbuf.data;
    hdr->type = ICMP_TYPE_UNREACH;
    hdr->code = code;
    hdr->id16 = 0;
    hdr->seq16 = 0;
    
    // 计算校验和
    hdr->checksum16 = 0;
    hdr->checksum16 = checksum16((uint16_t *)txbuf.data, txbuf.len);

    // 发送数据报
    ip_out(&txbuf, src_ip, NET_PROTOCOL_ICMP);
}

/**
 * @brief 初始化icmp协议
 * 
 */
void icmp_init(){
    net_add_protocol(NET_PROTOCOL_ICMP, icmp_in);
}