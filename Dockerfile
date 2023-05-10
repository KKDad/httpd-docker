FROM alpine:latest
LABEL MAINTAINER=adrian@gilbert.ca

RUN apk add --no-cache tini busybox-extras

COPY ./static/*.sh /
COPY ./static/httpd.conf /etc/

#WORKDIR /var/www/html

EXPOSE 80
ENTRYPOINT ["/sbin/tini", "-g", "--"]
CMD ["/entrypoint.sh"]
HEALTHCHECK --interval=5s --timeout=1500ms --start-period=10s --retries=3 CMD ["/docker-healthcheck.sh"]

