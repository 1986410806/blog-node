FROM node:alpine

MAINTAINER zhaohuinan <1986410806@qq.com>

USER root

COPY . /app

WORKDIR /app

RUN rm -rf app.config.js node_modules package-lock.json && \
    mv app.config_pro.js app.config.js && \
    yarn config set registry https://registry.npm.taobao.org && \
    yarn global add pm2 && \
    yarn install --production


EXPOSE 3000

CMD pm2-runtime bin/www