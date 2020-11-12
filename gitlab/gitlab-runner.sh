#!/bin/bash

# 启动gitlab-runner
docker run -d --name gitlab-runner --restart always \
     -v /srv/gitlab-runner/config:/etc/gitlab-runner \
     -v /var/run/docker.sock:/var/run/docker.sock \
     gitlab/gitlab-runner:latest

# 把runner注册到gitlab中
docker run --rm -it -v /srv/gitlab-runner/config:/etc/gitlab-runner gitlab/gitlab-runner register


# 如果需要启动多个runner，修改以上两个脚本中容器配置文件的路径和容器的名称，重复执行命令即可