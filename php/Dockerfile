FROM nmcteam/php56
MAINTAINER TCDP gilles@triptyk.eu



### -------------------------------- ###
### ----- 3 - Install Packages ----- ###
### -------------------------------- ###
RUN apt-get -y install php-pear

RUN pear channel-discover pear.drush.org && pear install drush/drush


### -------------------------------------- ###
### ----- 8 - Clean & Initialization ----- ###
### -------------------------------------- ###
# Clean #
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN apt-get autoremove -y
