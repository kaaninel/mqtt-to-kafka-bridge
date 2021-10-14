FROM node as build
WORKDIR /app
COPY package.json .
RUN ["npm", "install"]

FROM node
WORKDIR /app
RUN apk --no-cache add \
      bash \
      g++ \
      ca-certificates \
      lz4-dev \
      musl-dev \
      cyrus-sasl-dev \
      openssl-dev \
      make \
      python

RUN apk add --no-cache --virtual .build-deps gcc zlib-dev libc-dev bsd-compat-headers py-setuptools bash
COPY --from=build /app .
COPY . .
ENTRYPOINT ["node", "main.js"]
