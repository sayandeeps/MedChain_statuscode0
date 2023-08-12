const express = require("express");
const path = require("path");
const app = express();

app.get("/pdetails", (req, res) => {
    res.sendFile(path.join(__dirname + "/viewpatients.html"));
})
app.get("/pregister", (req, res) => {
    res.sendFile(path.join(__dirname + "/setPatientsdetails.html"));
})
const server = app.listen(6988);
const portNumber = server.address().port;
console.log(`port is open on ${portNumber}`);