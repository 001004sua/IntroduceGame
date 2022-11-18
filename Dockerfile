FROM node:alpine
//RUN apt-get update && apt-get -y install build-essential && mkdir –p /app 
WORKDIR /app
COPY . /app/
RUN npm install
CMD ["node", "app.js"]
