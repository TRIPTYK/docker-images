#!/bin/bash
usermod -u $DOCKER_USER_ID www-data
groupmod -g $(($DOCKER_USER_GID + 10000)) $(getent group $DOCKER_USER_GID | cut -d: -f1)
groupmod -g ${DOCKER_USER_GID} staff
chown -R www-data:staff /server
pm2-dev start /environment/processes.json
# exec supervisord -n
