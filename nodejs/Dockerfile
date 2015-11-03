FROM phusion/baseimage:latest
MAINTAINER The Crazy Digital Painter <gilles@triptyk.eu>

ENV DOCKER_USER_ID 501
ENV DOCKER_USER_GID 20

ENV BOOT2DOCKER_ID 1000
ENV BOOT2DOCKER_GID 50

# Tweaks to give node write permissions to the app
RUN usermod -u ${BOOT2DOCKER_ID} www-data && \
    usermod -G staff www-data

RUN groupmod -g $(($BOOT2DOCKER_GID + 10000)) $(getent group $BOOT2DOCKER_GID | cut -d: -f1)
RUN groupmod -g ${BOOT2DOCKER_GID} staff

# Install packages
ENV DEBIAN_FRONTEND noninteractive
RUN \
  apt-get update && \
  apt-get upgrade -y
# Install Node & NPM

RUN \
#
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash - &&\
apt-get install -y nodejs

# #Install PM2 https://github.com/Unitech/pm2
RUN npm install pm2 -g
#
# #ajoute les fichiers
ADD run.sh /run.sh
ADD server /server
ADD environment /environment
#
#
VOLUME  "/server" "/environment" "/var/logs"
#
EXPOSE 7000-10000
CMD ["/run.sh"]
