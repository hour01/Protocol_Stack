#include "net.h"
#include "ip.h"
#include "ethernet.h"
#include "arp.h"
#include "icmp.h"

/**
 * @brief 处理一个收到的数据包
 * 
 * @param buf 要处理的数据包
 * @param src_mac 源mac地址
 */
void ip_in(buf_t *buf, uint8_t *src_mac)
{
    // TO-DO
    // 长度检测:
    // 长度小于IP头部长度则丢弃
    if(buf->len < sizeof(ip_hdr_t)) return;
    
    // 报头检测
    ip_hdr_t* hdr = (ip_hdr_t*)buf->data;
    // 版本，总长度字段小于或等于收到包的长度
    if(hdr->version != IP_VERSION_4 || swap16(hdr->total_len16) > buf->len
        || hdr->hdr_len < 5)
        return;

    // 校验和检测，没必要进行大小端转换
    uint16_t checksum = hdr->hdr_checksum16;
    hdr->hdr_checksum16 = 0;
    if (checksum != checksum16((uint16_t *)hdr, hdr->hdr_len * IP_HDR_LEN_PER_BYTE))
        return;
    // 恢复
    hdr->hdr_checksum16 = checksum;

    // 检查目的ip是否是本机ip
    if(memcmp(hdr->dst_ip, net_if_ip, NET_IP_LEN) != 0)   
        return;

    // 若数据包有填充字段，去除填充的0
    if(swap16(hdr->total_len16) < buf->len)
        buf_remove_padding(buf, buf->len - swap16(hdr->total_len16));

    // 协议不可达
    if(!(hdr->protocol == NET_PROTOCOL_UDP ||
         hdr->protocol == NET_PROTOCOL_ICMP ||
         hdr->protocol == NET_PROTOCOL_TCP))  // tcp
        icmp_unreachable(buf, hdr->src_ip, ICMP_CODE_PROTOCOL_UNREACH);

    // 去除报头
    buf_remove_header(buf, sizeof(ip_hdr_t));

    // 向上传递数据包
    net_in(buf, hdr->protocol, hdr->src_ip);
}

/**
 * @brief 处理一个要发送的ip分片
 * 
 * @param buf 要发送的分片
 * @param ip 目标ip地址
 * @param protocol 上层协议
 * @param id 数据包id
 * @param offset 分片offset，必须被8整除
 * @param mf 分片mf标志，是否有下一个分片
 */
void ip_fragment_out(buf_t *buf, uint8_t *ip, net_protocol_t protocol, int id, uint16_t offset, int mf)
{
    // TO-DO
    // 增加头部
    buf_add_header(buf, sizeof(ip_hdr_t));
    ip_hdr_t *hdr = (ip_hdr_t *)buf->data;

    // 填写头部字段
    hdr->hdr_len = sizeof(ip_hdr_t) / IP_HDR_LEN_PER_BYTE;
    hdr->version = IP_VERSION_4;
    hdr->tos = 0;
    hdr->total_len16 = swap16(buf->len);
    hdr->id16 = swap16(id);

    hdr->flags_fragment16 = mf==1 ? swap16(IP_MORE_FRAGMENT | offset) : swap16(offset);

    hdr->ttl = IP_DEFALUT_TTL;
    hdr->protocol = protocol;
    memcpy(hdr->src_ip, net_if_ip, NET_IP_LEN);
    memcpy(hdr->dst_ip, ip, NET_IP_LEN);

    // 计算校验和, 统一不进行大小端转换
    hdr->hdr_checksum16 = 0;
    hdr->hdr_checksum16 = checksum16((uint16_t *)hdr, sizeof(ip_hdr_t));

    // 发送
    arp_out(buf, ip);
}

/**
 * @brief 处理一个要发送的ip数据包
 * 
 * @param buf 要处理的包
 * @param ip 目标ip地址
 * @param protocol 上层协议
 */

uint16_t ip_id = 0;
void ip_out(buf_t *buf, uint8_t *ip, net_protocol_t protocol)
{
    // TO-DO
    uint16_t max_len = ETHERNET_MAX_TRANSPORT_UNIT - sizeof(ip_hdr_t);

    // 上层传递下来的数据报包长小于IP协议最大负载包长，直接发送
    if (buf->len <= max_len) {
        ip_fragment_out(buf, ip, protocol, ip_id++, 0, 0);
        return;
    }

    // 上层传递下来的数据报包长大于IP协议最大负载包长，分片发送
    uint16_t cur = 0;
    buf_t ip_buf;
    buf_t* ip_buf_p = &ip_buf;
    while (buf->len > max_len) {
        buf_init(ip_buf_p, max_len);

        // 截断数据包
        memcpy(ip_buf_p->data, buf->data, max_len);
        buf_remove_header(buf, max_len);

        ip_fragment_out(ip_buf_p, ip, protocol, ip_id, cur/IP_HDR_OFFSET_PER_BYTE, 1);
        cur += max_len;
    }

    // 发送最后一个分片
    if (buf->len > 0) {
        buf_init(ip_buf_p, buf->len);

        // 截断数据包
        memcpy(ip_buf_p->data, buf->data, buf->len);
        buf_remove_header(buf, buf->len);

        ip_fragment_out(ip_buf_p, ip, protocol, ip_id, cur/IP_HDR_OFFSET_PER_BYTE, 0);
    }
    ip_id++;
}

/**
 * @brief 初始化ip协议
 * 
 */
void ip_init()
{
    net_add_protocol(NET_PROTOCOL_IP, ip_in);
}