FROM node:14.17.3

# Install tools & libs to compile everything
RUN apt-get update && apt-get install

RUN apt-get install -y gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget libgbm1


COPY . /volvo_campaign_test
WORKDIR /volvo_campaign_test

#RUN npm install @wdio/cli
RUN npm install chrome -g
RUN npm install -g webdriverio 
RUN npm install wdio-mocha-framework

ENTRYPOINT ./node_modules/.bin/wdio run wdio.conf.js