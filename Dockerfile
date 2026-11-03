FROM node:24-alpine

WORKDIR /app

COPY app/package*.json ./

RUN npm install

COPY app/ ./

USER node

EXPOSE 3000

CMD ["node", "server.js"]
