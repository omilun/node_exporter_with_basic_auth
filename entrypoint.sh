#!/bin/bash

echo -n "$USERNAME:$PASSWD" > /etc/nginx/htpasswd
chmod 644 /etc/nginx/htpasswd
nginx -c /etc/nginx/nginx.conf &
exec /usr/bin/node_exporter "$@"
