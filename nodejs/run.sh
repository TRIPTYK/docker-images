#!/bin/bash

    usermod -u $DOCKER_USER_ID www-data
    groupmod -g $(($DOCKER_USER_GID + 10000)) $(getent group $DOCKER_USER_GID | cut -d: -f1)
    groupmod -g ${DOCKER_USER_GID} staff
   # Tweaks to give Apache/PHP write permissions to the app
    chown -R www-data:staff /var/www

exec supervisord -n
