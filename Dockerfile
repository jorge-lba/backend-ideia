FROM node:12.18.3

WORKDIR /usr/src/app

ENV PORT 8080
ENV HOST 0.0.0.0

COPY package*.json ./

RUN npm install
RUN npm build

COPY . .

EXPOSE $PORT

CMD [ "npm", "start" ]