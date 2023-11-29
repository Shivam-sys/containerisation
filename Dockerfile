# Use explicit and deterministic Docker base image tags
FROM node:16.17.0-bullseye-slim
# Install dumb-init 
RUN apt-get update && apt-get install -y --no-install-recommends dumb-init

# Optimize Node.js tooling for production
ENV NODE_ENV production
ENV DEBUG=containerisation:*

WORKDIR /usr/src/app

# Don’t run containers as root
COPY --chown=node:node . /usr/src/app

# Install dependencied from Lockfile, and Don't install devDependencies,
RUN npm ci --only=production

USER node

#Run node with dumb-init 
CMD ["dumb-init", "node", "./bin/www"] 
# or CMD ["dumb-init", "npm", "start"]