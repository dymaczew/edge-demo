'use strict';

const express = require('express');

// Constants
const PORT = 8080;
const HOST = '0.0.0.0';

// App
const app = express();
var randomWords = require('random-words');
app.get('/', (req, res) => {
	res.send("V1 battery " + randomWords({exactly:1, wordsPerString:2, separator:'-'}) + "\n");
});

app.listen(PORT, HOST);
console.log(`V1 battery - running on http://${HOST}:${PORT}`);
