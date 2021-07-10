FROM node:alpine

MAINTAINER zhaohuinan <1986410806@qq.com>

WORKDIR /app

ADD package.json  .

RUN  yarn config set registry https://registry.npm.taobao.org && \
    yarn global add pm2 && \
    yarn install --production --no-cache

COPY . /app
ADD app.config_pro.js app.config.js

EXPOSE 3000

CMD pm2-runtime bin/www