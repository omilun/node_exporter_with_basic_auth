FROM wkulhanek/node-exporter:0.17.0

USER root

ENV USERNAME ""
ENV PASSWD ""
RUN yum update -y && \
    yum install -y epel-release && \
    yum install -y nginx && \
    mkdir -p /var/log/nginx && \
    mkdir -p /etc/nginx && \
    chgrp -R 0        /var/log /var/run /var/tmp /var/lib/nginx && \
    chmod -R g=u,a+rx /var/log /var/run /var/tmp /var/lib/nginx && \
    # in the container logs.
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

ADD entrypoint.sh /entrypoint.sh
ADD nginx.conf /etc/nginx/nginx.conf

RUN touch /etc/nginx/htpasswd ; chmod 777 /etc/nginx/htpasswd
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 9180

USER 1001
