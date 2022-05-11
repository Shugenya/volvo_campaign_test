FROM node:14.17.3

# Install tools & libs to compile everything
RUN sudo apt-get update && apt-get install


COPY . /volvo_campaign_test
WORKDIR /volvo_campaign_test

RUN npm install @wdio/cli
RUN npm install -g webdriverio
RUN npm install wdio-chromedriver-service

ENTRYPOINT ["./node_modules/.bin/wdio", "wdio.conf.js"]