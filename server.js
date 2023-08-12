const express = require("express");
const path = require("path");
const app = express();

app.get("/pdetails", (req, res) => {
    res.sendFile(path.join(__dirname + "/viewpatients.html"));
})
app.get("/pregister", (req, res) => {
    res.sendFile(path.join(__dirname + "/setPatientsdetails.html"));
})
app.get("/dview", (req, res) => {
    res.sendFile(path.join(__dirname + "/viewdoc.html"));
})
app.get("/dset", (req, res) => {
    res.sendFile(path.join(__dirname + "/setDoc.html"));
})
app.get("/aview", (req, res) => {
    res.sendFile(path.join(__dirname + "/appointmentview.html"));
})
app.get("/dedit", (req, res) => {
    res.sendFile(path.join(__dirname + "/editdoc.html"));
})
const server = app.listen(6988);
const portNumber = server.address().port;
console.log(`port is open on ${portNumber}`);