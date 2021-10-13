FROM node as build
WORKDIR /app
COPY package.json .
RUN ["npm", "install"]

FROM node
WORKDIR /app
COPY --from=build /app .
COPY . .
ENTRYPOINT ["node", "main.js"]