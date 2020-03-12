'use strict';

const express = require('express');

// Constants
const PORT = 8080;
const HOST = '0.0.0.0';

// App
const app = express();
var randomWords = require('random-words');
app.get('/', (req, res) => {
	res.send("V2 battery " + randomWords({exactly:1, wordsPerString:5, separator:'-'}) + "\n");
});

app.listen(PORT, HOST);
console.log(`V2 battery - running on http://${HOST}:${PORT}`);
