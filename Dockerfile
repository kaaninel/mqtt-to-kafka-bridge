FROM node as build
WORKDIR /app
COPY package.json .
RUN ["npm", "install"]

FROM node
WORKDIR /app
COPY --from=build /app .
COPY . .
RUN ["node", "main.js"]