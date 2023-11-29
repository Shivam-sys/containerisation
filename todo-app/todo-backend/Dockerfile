FROM node:16.17.0-bullseye-slim

RUN apt-get update && apt-get install -y --no-install-recommends dumb-init

ENV DEBUG=todo-express-backend:*

WORKDIR /usr/src/app

COPY package* .

RUN npm ci

COPY --chown=node:node . /usr/src/app

USER node

CMD ["dumb-init", "npm", "start"] 