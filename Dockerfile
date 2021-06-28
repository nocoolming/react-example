# FROM node:lts-buster-slim
FROM nginx

WORKDIR /web

COPY ./build/* .


