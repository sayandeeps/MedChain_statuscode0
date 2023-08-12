'use strict';
const express = require('express');
const auth = require('./auth.js');

const app = express();

const http = require('http').createServer(app);
//const io = require('socket.io')(http);


app.set('views', './views');

app.use('/public', express.static(process.cwd() + '/public'));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));


app.get('/', (req, res) => {
    res.sendFile(__dirname + '/views/index.html');
});

// Port
const PORT = process.env.PORT || 2000;
http.listen(PORT, () => {
    console.log(`Listening on port ${PORT}`);
});