# FROM node:12.18.3

# WORKDIR /usr/src/app

# ENV PORT 8080
# ENV HOST 0.0.0.0

# COPY package*.json ./

# RUN npm install
# RUN npm build

# COPY . .

# EXPOSE $PORT

# CMD [ "npm", "start" ]

FROM node:lts-alpine

RUN mkdir -p /home/node/app/node_modules

WORKDIR /home/node/app

COPY package.json yarn.* ./

RUN apk add --no-cache git

COPY . /home/node/app/

RUN chown -R node:node /home/node

RUN yarn

USER node

EXPOSE 8080

ENTRYPOINT ["node","ace","serve","--watch"]