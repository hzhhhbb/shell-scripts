#!/bin/bash

echo 'Installing nginx'

echo 'Step 1'

yum -y install yum-utils

nginx.repo='[nginx-stable]
name=nginx stable repo
baseurl=http://nginx.org/packages/centos/$releasever/$basearch/
gpgcheck=1
enabled=1
gpgkey=https://nginx.org/keys/nginx_signing.key
module_hotfixes=true

[nginx-mainline]
name=nginx mainline repo
baseurl=http://nginx.org/packages/mainline/centos/$releasever/$basearch/
gpgcheck=1
enabled=0
gpgkey=https://nginx.org/keys/nginx_signing.key
module_hotfixes=true'

echo ${nginx.repo} > /etc/yum.repos.d/nginx.repo

sudo yum -y install nginx

# 启动nginx
sudo systemctl start nginx

# 设置开机启动nginx
sudo systemctl enable nginx