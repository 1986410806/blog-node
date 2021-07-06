FROM node:alpine

WORKDIR /app

COPY . /app

RUN rm -rf app.config.js node_modules package-lock.json
RUN mv app.config_pro.js app.config.js
RUN npm -v && node -v
RUN npm install
RUN npm install -g pm2
RUN npm cache clean

EXPOSE 3000

CMD pm2 start app.js