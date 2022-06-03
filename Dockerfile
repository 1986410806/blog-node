FROM node:alpine

WORKDIR /app

ADD package.json  .

RUN  yarn config set registry https://registry.npm.taobao.org && \
    yarn global add pm2 && \
    yarn --production --no-cache

COPY . .
ADD app.config_pro.js app.config.js

EXPOSE 3000

CMD pm2-runtime bin/www