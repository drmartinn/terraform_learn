#!/bin/bash
export PATH=$PATH:/usr/local/bin
sudo -i
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
yum install -y httpd curl
echo "<html><h1>Hola, exclente ejercicio server2...<p></p><p>Continuamos</p></h1></html>" > /var/www/html/index.html
systemctl start httpd
systemctl restart httpd
systemctl enable httpd