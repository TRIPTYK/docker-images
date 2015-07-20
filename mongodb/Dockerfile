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
  apt-get install wget

# Install Node & NPM
# RUN \
  # cd /tmp && \
  # wget https://nodejs.org/dist/v0.12.7/node-v0.12.7-linux-x64.tar.gz && \
  # tar -C /usr/local --strip-components 1 -xzf node-v0.12.7-linux-x64.tar.gz && \
  # ls -l /usr/local/bin/node && \
  # ls -l /usr/local/bin/npm

#Install PM2 https://github.com/Unitech/pm2
# RUN npm install pm2 -g

#ajoute les fichiers
ADD run.sh /run.sh

ADD environment /environment


VOLUME  "/db" "/environment" "/var/logs"

EXPOSE 8000
CMD ["/run.sh"]
