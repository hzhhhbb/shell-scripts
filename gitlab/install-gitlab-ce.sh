#!/bin/bash

# 在docker中安装gitlab-ce

# 设置gitlab数据存放路径
export GITLAB_HOME=/srv/gitlab

chmod +x docker-compose.yml 

docker-compose up -d
