FROM node:14

# Install tools & libs to compile everything
RUN apt-get update && apt-get install -y && apt-get clean

COPY . /volvo_campaign_test
WORKDIR /volvo_campaign_test
RUN npm install
