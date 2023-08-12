// server.js or app.js

const express = require('express');
const authRouter = require('./auth.js');

const app = express();

app.use('/', authRouter);

app.listen(8080, () => console.log("Server started on port 8080"));