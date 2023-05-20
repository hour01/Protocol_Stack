#include <string.h>
#include <stdio.h>
#include "net.h"
#include "arp.h"
#include "ethernet.h"
/**
 * @brief 初始的arp包
 * 
 */
static const arp_pkt_t arp_init_pkt = {
    .hw_type16 = constswap16(ARP_HW_ETHER),
    .pro_type16 = constswap16(NET_PROTOCOL_IP),
    .hw_len = NET_MAC_LEN,
    .pro_len = NET_IP_LEN,
    .sender_ip = NET_IF_IP,
    .sender_mac = NET_IF_MAC,
    .target_mac = {0}};

/**
 * @brief arp地址转换表，<ip,mac>的容器
 * 
 */
map_t arp_table;

/**
 * @brief arp buffer，<ip,buf_t>的容器
 * 
 */
map_t arp_buf;

/**
 * @brief 打印一条arp表项
 * 
 * @param ip 表项的ip地址
 * @param mac 表项的mac地址
 * @param timestamp 表项的更新时间
 */
void arp_entry_print(void *ip, void *mac, time_t *timestamp)
{
    printf("%s | %s | %s\n", iptos(ip), mactos(mac), timetos(*timestamp));
}

/**
 * @brief 打印整个arp表
 * 
 */
void arp_print()
{
    printf("===ARP TABLE BEGIN===\n");
    map_foreach(&arp_table, arp_entry_print);
    printf("===ARP TABLE  END ===\n");
}

/**
 * @brief 发送一个arp请求
 * 
 * @param target_ip 想要知道的目标的ip地址
 */
void arp_req(uint8_t *target_ip)
{
    // TO-DO
    // 调用buf_init()对txbuf进行初始化
    buf_init(&txbuf, sizeof(arp_pkt_t));

    // 填写ARP报头
    arp_pkt_t *data = (arp_pkt_t *)txbuf.data;
    memcpy(data, &arp_init_pkt, sizeof(arp_pkt_t));
    // ARP操作类型为ARP_REQUEST，注意大小端转换
    data->opcode16 = swap16(ARP_REQUEST);
    memcpy(data->target_ip, target_ip, NET_IP_LEN);

    // 调用ethernet_out函数将ARP报文发送出去
    ethernet_out(&txbuf, ether_broadcast_mac, NET_PROTOCOL_ARP);
}

/**
 * @brief 发送一个arp响应
 * 
 * @param target_ip 目标ip地址
 * @param target_mac 目标mac地址
 */
void arp_resp(uint8_t *target_ip, uint8_t *target_mac)
{
    // TO-DO
    // 调用buf_init()来初始化txbuf
    buf_init(&txbuf, sizeof(arp_pkt_t));

    // 填写ARP报头首部
    arp_pkt_t *data = (arp_pkt_t *)txbuf.data;
    memcpy(data, &arp_init_pkt, sizeof(arp_pkt_t));
    data->opcode16 = swap16(ARP_REPLY);
    memcpy(data->target_ip, target_ip, NET_IP_LEN);
    memcpy(data->target_mac, target_mac, NET_MAC_LEN);
    // 调用ethernet_out()函数将填充好的ARP报文发送出去
    ethernet_out(&txbuf, target_mac, NET_PROTOCOL_ARP);
}

/**
 * @brief 处理一个收到的数据包
 * 
 * @param buf 要处理的数据包
 * @param src_mac 源mac地址
 */
void arp_in(buf_t *buf, uint8_t *src_mac)
{
    // TO-DO
    // 判断数据长度
    if(buf->len < sizeof(arp_pkt_t))    return;

    // 报头检查
    arp_pkt_t *arp_data = (arp_pkt_t *)buf->data;
    if(arp_data->hw_type16 == swap16(ARP_HW_ETHER) && 
        arp_data->pro_type16 == swap16(NET_PROTOCOL_IP) &&
        arp_data->hw_len == NET_MAC_LEN &&
        arp_data->pro_len == NET_IP_LEN &&
        (arp_data->opcode16 == swap16(ARP_REQUEST) ||
        arp_data->opcode16 == swap16(ARP_REPLY)))
    {
        // 调用map_set()函数更新ARP表项
        map_set(&arp_table, arp_data->sender_ip, arp_data->sender_mac);

        // 该接收报文的IP地址是否有对应的arp_buf缓存
        buf_t *cache = map_get(&arp_buf, arp_data->sender_ip);

        // 如果有缓存，处理该待发送的数据包
        // 如果本机发送过该IP地址的询问，则一定存在该缓存。
        if (cache != NULL) {
            ethernet_out(cache, arp_data->sender_mac, NET_PROTOCOL_IP);
            map_delete(&arp_buf, arp_data->sender_ip);
            return;
        }

        // 否则，进一步判断该数据包是否是请求本主机MAC地址的ARP请求报文
        if (arp_data->opcode16 == swap16(ARP_REQUEST) &&
            memcmp(arp_data->target_ip, net_if_ip, NET_IP_LEN) == 0) {
            arp_resp(arp_data->sender_ip, arp_data->sender_mac);
        }
    }
}

/**
 * @brief 处理一个要发送的数据包
 * 
 * @param buf 要处理的数据包
 * @param ip 目标ip地址
 * @param protocol 上层协议
 */
void arp_out(buf_t *buf, uint8_t *ip)
{
    // TO-DO
    // 调用map_get()函数，根据IP地址来查找ARP表(arp_table)
    uint8_t *mac = map_get(&arp_table, ip);

    // 数据包直接发送给以太网层
    if(mac != NULL)
        ethernet_out(buf, mac, NET_PROTOCOL_IP);
    // 进一步判断arp_buf是否已经有包了
    else{
        // 不能再发送arp请求
        if(map_get(&arp_buf, ip) != NULL)    return;

        map_set(&arp_buf, ip, buf);
        arp_req(ip);
    }
}

/**
 * @brief 初始化arp协议
 * 
 */
void arp_init()
{
    map_init(&arp_table, NET_IP_LEN, NET_MAC_LEN, 0, ARP_TIMEOUT_SEC, NULL);
    map_init(&arp_buf, NET_IP_LEN, sizeof(buf_t), 0, ARP_MIN_INTERVAL, buf_copy);
    net_add_protocol(NET_PROTOCOL_ARP, arp_in);
    arp_req(net_if_ip);
}