"use strict";

const Bridge = require("./index.js");
const config = require("/etc/mqtt-kafka-bridge/config.js");

const bridge = new Bridge(config);
bridge.on("error", console.error);
bridge
    .run()
    .catch(console.error);
console.log("running");
