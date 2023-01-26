FROM node:lts-alpine3.17

ARG NODE_ENV=production
ARG VERSION=1.0.0
ARG PORT=8080

ENV NODE_ENV ${NODE_ENV}
ENV VERSION=${VERSION}
ENV PORT=${PORT}

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./

# RUN npm install
# If you are building your code for production
RUN npm ci --omit=dev

# Bundle app source
COPY . .

EXPOSE ${PORT}

# NOTE: NPM does not pass SIGTERM OS signal to Node process, thus Node is not able to do cleanup before exit.
# Docker and Kubernetes send SIGTERM to container process when they want to stop it.
# CMD [ "npm", "start" ]

CMD [ "node", "server.js" ]