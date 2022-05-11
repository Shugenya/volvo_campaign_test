FROM node:14

# Install tools & libs to compile everything
RUN apt-get update && apt-get install -y && apt-get clean && apt-get install -y libnss3

RUN apt-get install nss

RUN apt-get install -y chromium-chromedriver

RUN apt-get install libnss

RUN apt-get install libnss3-dev libgdk-pixbuf2.0-dev libgtk-3-dev libxss-dev

COPY . /volvo_campaign_test
WORKDIR /volvo_campaign_test
RUN npm install
RUN npm install chromedriver -g --unsafe-perm
RUN npm install -g @wdio/cli

ENTRYPOINT npm run wdio