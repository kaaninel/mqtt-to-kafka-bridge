FROM node as build
WORKDIR /app
COPY package.json .
RUN ["npm", "install"]

FROM node
WORKDIR /app
RUN apt install \
      bash \
      g++ \
      ca-certificates \
      lz4-dev \
      musl-dev \
      cyrus-sasl-dev \
      openssl-dev \
      make \
      python

RUN apt install build-deps gcc zlib-dev libc-dev bsd-compat-headers py-setuptools bash
COPY --from=build /app .
COPY . .
ENTRYPOINT ["node", "main.js"]
