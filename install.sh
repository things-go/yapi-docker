#! /bin/bash
# 初始化mongodb的yapi数据库
docker run -it --rm \
  --link mongo \
  --network yapi-docker_yapi \
  thinkgos/yapi \
  node server/install.js