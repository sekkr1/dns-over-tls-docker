# DNS-over-TLS Docker

A DNS-over-TLS server docker to serve as a front to your DNS server.

This will allow you to use your DNS server in Android's Private DNS feature.

You could use pihole as your DNS server for example to have adblocking on your phone without messing with VPN-based adblocking apps.

Based on the work by [varunsdridharan](https://github.com/varunsridharan/pi-hole-android-private-dns).

## How to use

Using the Docker CLI:

`docker run -v /path_to_your_certs:/ssl:ro -p 853:853/tcp -e DNS_UPSTREAM=your_dns_server -d sekkr1/dns-over-tls`

Using docker-compose:

```yaml
dns-over-tls:
    image: sekkr1/dns-over-tls
    container_name: dns-over-tls
    environment:
        - DNS_UPSTREAM=your_dns_container
    volumes:
        - /path_to_your_certs:/ssl:ro
    ports:
        - "853:853/tcp"
    links:
        - your_dns_container
    restart: unless-stopped
```

