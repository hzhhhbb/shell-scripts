#!/bin/bash

docker run -d --net host --name gitlab-runner  --restart always \
     -v /srv/gitlab-runner/config:/etc/gitlab-runner \
     -v /var/run/docker.sock:/var/run/docker.sock \
     gitlab/gitlab-runner:latest

docker run -it --rm -v /srv/gitlab-runner/config:/etc/gitlab-runner gitlab/gitlab-runner register \
  --non-interactive \
  --executor "docker" \
  --docker-privileged \
  --docker-image docker:latest \
  --url "http://172.21.23.120" \
  --registration-token "acSbUWwnf_stmMM1Tnmm" \
  --description "docker-runner" \
  --tag-list "build" \
  --run-untagged="true" \
  --locked="false" \
  --access-level="not_protected"  

  docker run -it --rm -v /srv/gitlab-runner/config:/etc/gitlab-runner gitlab/gitlab-runner register \
  --non-interactive \
  --executor "docker" \
  --docker-privileged \
  --docker-image docker:latest \
  --url "http://172.21.23.120" \
  --registration-token "acSbUWwnf_stmMM1Tnmm" \
  --description "docker-runner" \
  --tag-list "test" \
  --run-untagged="true" \
  --locked="false" \
  --access-level="not_protected"

  docker run -it --rm -v /srv/gitlab-runner/config:/etc/gitlab-runner gitlab/gitlab-runner register \
  --non-interactive \
  --executor "docker" \
  --docker-privileged \
  --docker-image docker:latest \
  --url "http://172.21.23.120" \
  --registration-token "acSbUWwnf_stmMM1Tnmm" \
  --description "docker-runner" \
  --tag-list "docker-build-image" \
  --run-untagged="true" \
  --locked="false" \
  --access-level="not_protected"