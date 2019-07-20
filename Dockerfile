FROM node:alpine as builder 
WORKDIR '/app'
COPY package.json .
COPY . .
RUN nom run build 

FROM nginx
COPY —from=builder /app/build /usr/share/nginx/html
