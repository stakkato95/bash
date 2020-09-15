#!/bin/bash
# Author: Artsiom
# Date: 14/09/2020
# Description: Setup an apache server
# Modified: 14/09/2020

https://www.linode.com/docs/web-servers/lamp/how-to-install-a-lamp-stack-on-centos-8/
https://www.linode.com/docs/web-servers/apache/how-to-install-and-configure-fastcgi-and-php-fpm-on-centos-8/
http://httpd.apache.org/docs/2.4/vhosts/examples.html # IMPORTANT: add "Listen <port>" in extra virtual hosts

# WEB server guides
https://www.linode.com/docs/web-servers/

# Apache settings
less /etc/httpd/conf/httpd.conf
# make a backup of settings
sudo cp /etc/httpd/conf/httpd.conf ~/httpd.conf.backup
# default error logs
sudo less /var/log/httpd/error_log 


# Prefork
# Prefork - each request is handled in a new process with 1 thread. Ideal for single-threaded apps (PHP) and is resource intensive.


# Logs
# print only error info without timestamp
sudo cat /var/log/httpd/error_log | awk -F"]" '{print $4}'
# show time and request from access log
sudo cat /var/log/httpd/access_log | awk -F"-" '{print $3}'


# Modules
# list installed modules
ls -l /etc/httpd/modules
# path of module configs
ls -l /etc/httpd/conf.d


# PHP
# 1 install php
sudo dnf install php php-fpm

# 2 start editing config file
vi /etc/httpd/conf/httpd.conf

# 3 set server name
# ServerName 127.0.0.1:80

# 4 append index.php to "dir_module"
#       <IfModule dir_module>
#          DirectoryIndex index.html index.php
#       </IfModule>

# 5 find php pages matched by regex
# <IfModule proxy_fcgi_module>
#     ProxyPassMatch ^/(.*\.php)$ fcgi://127.0.0.1:9000/var/www/html/$1
# </IfModule>

# 6 copy new index page to the root of apache
# sudo cp /usr/share/httpd/noindex/index.html /var/www/html

# 7 disable loading of the default Apache page 
# /etc/httpd/conf.d/welcome.conf

# open 127.0.0.1 in bowser
