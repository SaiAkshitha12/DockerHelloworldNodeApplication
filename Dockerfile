FROM node:18
WORKDIR /Hello
COPY . .
RUN npm install
CMD [ "node", "app.js" ]
