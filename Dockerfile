FROM nginx

MAINTAINER mario.fernandez@ibm.com

RUN apt-get update && apt-get install -y curl

COPY ./bootstrap-demo /usr/share/nginx/html


