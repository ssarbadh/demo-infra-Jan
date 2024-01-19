#!/bin/bash

# Simple script to configure a web server 
# that can print its hostname when accessed at root on port 80

# Switch to root
# sudo su 
set +x
# Install nginx
echo "Install nginx"
yum install nginx -y

# prepare nginx configuration
echo "Prepare nginx configuration"

touch /etc/nginx/conf.d/hello_web.conf
echo "server {
        listen 80;
        # server_name www.pulleycloud.com;
        server_tokens off;

        client_max_body_size 20M;
        location / {
		root /usr/local/share/nginx/html;
		index index.html index.htm;
		try_files \$uri \$uri/ /index.html;
	    }
}">/etc/nginx/conf.d/hello_web.conf


# Prepare index.html
mkdir -p /usr/local/share/nginx/html
touch /usr/local/share/nginx/html/index.html
echo "Prepare index.html"
echo "
<html>
<body>
<p>hostname is: $(hostname)</p>
</body>
</html>">/usr/local/share/nginx/html/index.html

echo "
<html>
<body>
<p>hostname is: $(hostname)</p>
</body>
</html>">/usr/share/nginx/html/index.html


# Start Nginx Server
echo "Start nginx server"
sudo nginx -t && sudo nginx

# Reload 
echo "Reload configuration"
sudo nginx -t && sudo nginx -s reload

