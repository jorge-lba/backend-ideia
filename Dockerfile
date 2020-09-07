FROM node:12.18.3

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install yarn 

RUN yarn install

COPY . .

EXPOSE 3333

# ENTRYPOINT [ "./build" ]

CMD [ "yarn", "start" ]