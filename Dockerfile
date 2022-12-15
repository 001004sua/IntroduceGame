FROM ubuntu:20.04
RUN apt-get update && apt-get -y install build-essential && mkdir –p /app
RUN apt-get -qq install curl --yes
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get -qq install nodejs --yes
COPY . /app/
WORKDIR /app/
RUN npm install
ENV PORT 5000
EXPOSE 5000
CMD ["node", "app.js"]
