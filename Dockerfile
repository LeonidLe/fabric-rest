
FROM node:8-alpine
# LABEL com.fabric-rest.version="0.11"

# Create app directory
WORKDIR /usr/src/app

COPY "package.json" .

RUN apk add --update python make alpine-sdk libc6-compat \
&& npm install && npm cache rm --force \
&& apk del --purge python make alpine-sdk


COPY . .

EXPOSE 4000

CMD [ "npm", "start" ]