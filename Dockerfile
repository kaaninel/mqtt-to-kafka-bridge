FROM node as build
WORKDIR /app
COPY package.json .
RUN ["npm", "install"]

FROM node
WORKDIR /app
COPY --from=build /app .
COPY . .
RUN npm install node-rdkafka
ENTRYPOINT ["node", "main.js"]
