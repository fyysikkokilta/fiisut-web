FROM node:14-bullseye-slim

LABEL version="0.1" \
    description="Online Fiisut songbook based on Snapsen" \
    org.opencontainers.image.source="https://github.com/fyysikkokilta/fiisut-web"

WORKDIR /usr/src/app

# Optimise building by first installing deps.
COPY package.json yarn.lock ./
RUN yarn install

COPY . .
RUN npm run build

EXPOSE 9000
CMD [ "npm", "run", "serve", "--", "-H", "0.0.0.0" ]