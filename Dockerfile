# Node LTS 10.15 with alpine
# (a lightweight distribution)
FROM node:10.15.3-alpine
LABEL maintainer="Arthur D. <https://www.arthurdufour.com/>"

# add some required packages
RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh python make g++

# creates a directory for the app
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# install the app
COPY package*.json ./
RUN npm install

# bundle all source code
COPY . . 

