const express = require("express");
const path = require("path");
const app = express();
app.use(express.static(__dirname));
app.get("/pdetails", (req, res) => {
    res.sendFile(path.join(__dirname + "/viewpatients.html"));
})
app.get("/pregister", (req, res) => {
    res.sendFile(path.join(__dirname + "/setPatientsdetails.html"));
})
app.get("/pedit", (req, res) => {
    res.sendFile(path.join(__dirname + "/editpatients.html"));
})
app.get("/dview", (req, res) => {
    res.sendFile(path.join(__dirname + "/viewdoc.html"));
})
app.get("/dset", (req, res) => {
    res.sendFile(path.join(__dirname + "/setDoc.html"));
})
app.get("/dedit", (req, res) => {
    res.sendFile(path.join(__dirname + "/editdoc.html"));
})
app.get("/aview", (req, res) => {
    res.sendFile(path.join(__dirname + "/appointmentview.html"));
})

app.get("/aset", (req, res) => {
    res.sendFile(path.join(__dirname + "/setappointment.html"));
})
app.get("/aupdate", (req, res) => {
    res.sendFile(path.join(__dirname + "/updateappointment.html"));
})
app.get("/givepermi", (req, res) => {
    res.sendFile(path.join(__dirname + "/givepermission.html"));
})
app.get("/revokepermi", (req, res) => {
    res.sendFile(path.join(__dirname + "/revokepermi.html"));
})
app.get("/pdashboard", (req, res) => {
    res.sendFile(path.join(__dirname + "/patientdshbrd.html"));
})
app.get("/ddashboard", (req, res) => {
    res.sendFile(path.join(__dirname + "/docdashbrd.html"));
})
const server = app.listen(6988);
const portNumber = server.address().port;
console.log(`port is open on ${portNumber}`);