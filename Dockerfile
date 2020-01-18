FROM nginx:1.17-alpine

COPY dns-over-tls /etc/nginx/streams/
COPY append-to-nginx /tmp/
RUN cat /tmp/append-to-nginx >> /etc/nginx/nginx.conf
RUN rm /tmp/append-to-nginx
CMD sed -i "s/{dns_upstream}/$DNS_UPSTREAM/g" /etc/nginx/streams/dns-over-tls && nginx -g "daemon off;"

EXPOSE 853

