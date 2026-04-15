FROM owasp/modsecurity-crs:nginx

ENV ACCESSLOG=/var/log/nginx-modsecurity/access.json
ENV MODSEC_AUDIT_LOG=/var/log/nginx-modsecurity/modsecurity.json

USER root

COPY ./container-files/nginx/etc/templates/conf.d/logging.conf.template /etc/nginx/templates/conf.d/logging.conf.template

RUN mkdir -p /var/log/nginx-modsecurity && chown nginx:nginx /var/log/nginx-modsecurity

USER nginx
