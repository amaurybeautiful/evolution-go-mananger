FROM node:20-alpine

WORKDIR /app

COPY . .

RUN npm install && npm run build

EXPOSE 5174

CMD ["npm","run","preview","--","--host","--port","5174"]
