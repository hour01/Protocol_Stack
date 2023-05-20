#include "udp.h"
#include "ip.h"
#include "icmp.h"

/**
 * @brief udp处理程序表
 * 
 */
map_t udp_table;

/**
 * @brief udp伪校验和计算
 * 
 * @param buf 要计算的包
 * @param src_ip 源ip地址
 * @param dst_ip 目的ip地址
 * @return uint16_t 伪校验和
 */
static uint16_t udp_checksum(buf_t *buf, uint8_t *src_ip, uint8_t *dst_ip)
{
    // TO-DO
    uint16_t original_len = buf->len;
    // 添加伪头部
    buf_add_header(buf, sizeof(udp_peso_hdr_t));
    // 暂存将被覆盖的部分
    udp_peso_hdr_t tmp;
    memcpy(&tmp, buf->data, sizeof(udp_peso_hdr_t));
    // 填充伪头部
    // 先构造一个，防止覆盖*src_ip
    udp_peso_hdr_t udp_peso_hdr;
    memcpy(udp_peso_hdr.src_ip, src_ip, NET_IP_LEN);
    memcpy(udp_peso_hdr.dst_ip, dst_ip, NET_IP_LEN);
    udp_peso_hdr.placeholder = 0;
    udp_peso_hdr.protocol = NET_PROTOCOL_UDP;
    udp_peso_hdr.total_len16 = swap16(original_len);
    memcpy(buf->data, &udp_peso_hdr, sizeof(udp_peso_hdr_t));

    // udp_peso_hdr_t *phdr = (udp_peso_hdr_t *)buf->data;
    // memcpy(phdr->src_ip, src_ip, NET_IP_LEN);
    // memcpy(phdr->dst_ip, dst_ip, NET_IP_LEN);
    // phdr->placeholder = 0;
    // phdr->protocol = NET_PROTOCOL_UDP;
    // phdr->total_len16 = swap16(original_len);
    uint16_t checksum = checksum16((uint16_t *)buf->data, buf->len);
    // 拷回暂存的部分
    memcpy(buf->data, &tmp, sizeof(udp_peso_hdr_t));
    // 去掉伪头部
    buf_remove_header(buf, sizeof(udp_peso_hdr_t));
    // 返回校验和
    return checksum;
}

/**
 * @brief 处理一个收到的udp数据包
 * 
 * @param buf 要处理的包
 * @param src_ip 源ip地址
 */
void udp_in(buf_t *buf, uint8_t *src_ip)
{
    // TO-DO
    // 长度检测
    if (buf->len < sizeof(udp_hdr_t))  return;
    udp_hdr_t *udp_hdr = (udp_hdr_t *)buf->data;

    // 检查校验和
    uint16_t checksum16 = udp_hdr->checksum16;
    udp_hdr->checksum16 = 0;
    if (checksum16 != udp_checksum(buf, src_ip, net_if_ip))
        return;
    udp_hdr->checksum16 = checksum16;

    // 查询回调函数
    uint16_t dst_port16 = swap16(udp_hdr->dst_port16);
    udp_handler_t *handler = map_get(&udp_table, &dst_port16);

    // 端口不可达
    if(handler == NULL) {
        buf_add_header(buf, sizeof(ip_hdr_t));
        icmp_unreachable(buf, src_ip, ICMP_CODE_PORT_UNREACH);
        return;
    }
    
    // 去UDP报头，调用处理函数
    buf_remove_header(buf, sizeof(udp_hdr_t));
    (*handler)(buf->data, buf->len, src_ip, swap16(udp_hdr->src_port16));
}

/**
 * @brief 处理一个要发送的数据包
 * 
 * @param buf 要处理的包
 * @param src_port 源端口号
 * @param dst_ip 目的ip地址
 * @param dst_port 目的端口号
 */
void udp_out(buf_t *buf, uint16_t src_port, uint8_t *dst_ip, uint16_t dst_port)
{
    // TO-DO
    // 添加UDP报头
    buf_add_header(buf, sizeof(udp_hdr_t));
    udp_hdr_t* hdr = (udp_hdr_t*) buf->data;

    // 填充首部
    hdr->src_port16 = swap16(src_port);
    hdr->dst_port16 = swap16(dst_port);
    hdr->total_len16 = swap16(buf->len);

    // 计算UDP校验和
    hdr->checksum16 = 0;
    hdr->checksum16 = udp_checksum(buf, net_if_ip, dst_ip);

    // 发送UDP数据报
    ip_out(buf, dst_ip, NET_PROTOCOL_UDP);
}

/**
 * @brief 初始化udp协议
 * 
 */
void udp_init()
{
    map_init(&udp_table, sizeof(uint16_t), sizeof(udp_handler_t), 0, 0, NULL);
    net_add_protocol(NET_PROTOCOL_UDP, udp_in);
}

/**
 * @brief 打开一个udp端口并注册处理程序
 * 
 * @param port 端口号
 * @param handler 处理程序
 * @return int 成功为0，失败为-1
 */
int udp_open(uint16_t port, udp_handler_t handler)
{
    return map_set(&udp_table, &port, &handler);
}

/**
 * @brief 关闭一个udp端口
 * 
 * @param port 端口号
 */
void udp_close(uint16_t port)
{
    map_delete(&udp_table, &port);
}

/**
 * @brief 发送一个udp包
 * 
 * @param data 要发送的数据
 * @param len 数据长度
 * @param src_port 源端口号
 * @param dst_ip 目的ip地址
 * @param dst_port 目的端口号
 */
void udp_send(uint8_t *data, uint16_t len, uint16_t src_port, uint8_t *dst_ip, uint16_t dst_port)
{
    buf_init(&txbuf, len);
    memcpy(txbuf.data, data, len);
    udp_out(&txbuf, src_port, dst_ip, dst_port);
}