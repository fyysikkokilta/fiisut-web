FROM node:14-slim

LABEL version="0.1" \
    description="Online Fiisut songbook based on Snapsen" \
    org.opencontainers.image.source="https://github.com/fyysikkokilta/fiisut-web"

WORKDIR /usr/src/app

# Optimise building by first installing deps.
COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

EXPOSE 9000
CMD [ "npm", "run", "serve", "--", "-H", "0.0.0.0" ]