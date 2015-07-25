FROM phusion/baseimage
MAINTAINER TCDP gilles@triptyk.eu

CMD ["/sbin/my_init"]

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get --no-install-recommends -y install nginx

# Cleanup
RUN apt-get clean

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

RUN mkdir -p /etc/service/nginx
ADD start.sh /etc/service/nginx/run
RUN chmod +x /etc/service/nginx/run
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME  "/var/www" "/etc/nginx/sites-enabled" "/var/log"

EXPOSE 80
