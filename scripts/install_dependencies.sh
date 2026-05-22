#!/bin/bash
set -e

sudo yum install tomcat -y
sudo yum -y install httpd

sudo tee /etc/httpd/conf.d/tomcat_manager.conf > /dev/null << EOF
<VirtualHost *:80>
  ServerAdmin root@localhost
  ServerName app.icl.com
  DefaultType text/html
  ProxyRequests off
  ProxyPreserveHost On
  ProxyPass / http://localhost:8080/icl-web-project/
  ProxyPassReverse / http://localhost:8080/icl-web-project/
</VirtualHost>
EOF