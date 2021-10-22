FROM node:12 as builder

ARG version=1.9.3

WORKDIR /yapi

RUN apt-get install -y git python make openssl tar gcc && \
    wget https://github.com/YMFE/yapi/archive/refs/tags/v${version}.tar.gz && \
    tar zxvf v${version}.tar.gz && \
    mv yapi-${version} vendors && \
    cd vendors && \
    npm config set registry https://registry.npm.taobao.org \
    npm install --production --registry https://registry.npm.taobao.org

FROM node:12

ENV TZ="Asia/Shanghai"

WORKDIR /yapi/vendors

COPY --from=builder /yapi/vendors /yapi/vendors
COPY config.json /yapi

EXPOSE 3000

CMD ["node", "server/app.js"]