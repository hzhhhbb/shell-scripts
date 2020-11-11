#!/bin/bash

#说明：适用于在纯净的centos系统中，安装docker

# 1、卸载已有的docker
yum remove docker \
           docker-client \
           docker-client-latest \
           docker-common \
           docker-latest \
           docker-latest-logrotate \
           docker-logrotate \
           docker-selinux \
           docker-engine-selinux \
           docker-engine

#2、安装yum-utils工具
yum install yum-utils

# 3、配置yum docker-ce仓库
yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

# 4、刷新yum仓库缓存
yum makecache fast

# 5、安装docker-ce
yum install docker-ce -y

# 6、启动docker和设置docker自启动
systemctl enable docker
systemctl start docker

# 7、使用hello-world镜像测试docker是否成功安装
docker run hello-world
