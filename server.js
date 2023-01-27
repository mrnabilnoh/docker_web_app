'use strict';

const express = require('express');

// Constants
const NODE_ENV = process.env.NODE_ENV || 'production'
const VERSION = process.env.VERSION || '1.0.0';
const PORT = process.env.PORT || 8080;
const HOST = '0.0.0.0';

// App
const app = express();
app.get('/', (req, res) => {
  res.send(`Hello World version v${VERSION} in ${process.arch}`);
});

app.listen(PORT, HOST, () => {
  console.log(`Running (${NODE_ENV}) v${VERSION} on ${process.arch} at http://${HOST}:${PORT}`);
});

// Signal handling
process.on('SIGTERM', function () {
  console.log('SIGTERM: shutting down...');
});