#!/bin/bash
export PATH=$PATH:/usr/local/bin
sudo -i
yum update -y
yum install telnet -y
yum install postgresql -y