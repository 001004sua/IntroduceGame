FROM node:18
RUN apt-get update && apt-get -y install build-essential && mkdir –p /app
RUN npm install
COPY . /app/
WORKDIR /app/
CMD ["node", "app.js"]
