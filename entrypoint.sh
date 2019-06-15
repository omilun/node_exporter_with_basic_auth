#!/bin/bash

export PASSWD_ENCODED=$(openssl passwd -apr1 $PASSWD)
echo -n "$USERNAME:$PASSWD_ENCODED" > /etc/nginx/htpasswd
chmod 644 /etc/nginx/htpasswd
nginx -c /etc/nginx/nginx.conf &
exec /usr/bin/node_exporter --web.listen-address="127.0.0.1:9181" "$@"
