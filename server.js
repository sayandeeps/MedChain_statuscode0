const express = require("express");
const path = require("path");
const app = express();
app.use(express.static(__dirname));

app.get("/", (req, res) => {
    res.sendFile(path.join(__dirname + "/views/index.html"));
})
app.get("/pdetails", (req, res) => {
    res.sendFile(path.join(__dirname + "/views/viewpatients.html"));
})
app.get("/pregister", (req, res) => {
    res.sendFile(path.join(__dirname + "/views/setPatientsdetails.html"));
})
app.get("/pedit", (req, res) => {
    res.sendFile(path.join(__dirname + "/views/editpatients.html"));
})
app.get("/dview", (req, res) => {
    res.sendFile(path.join(__dirname + "/views/viewdoc.html"));
})
app.get("/dset", (req, res) => {
    res.sendFile(path.join(__dirname + "/views/setDoc.html"));
})
app.get("/dedit", (req, res) => {
    res.sendFile(path.join(__dirname + "/views/editdoc.html"));
})
app.get("/aview", (req, res) => {
    res.sendFile(path.join(__dirname + "/views/appointmentview.html"));
})

app.get("/aset", (req, res) => {
    res.sendFile(path.join(__dirname + "/views/setappointment.html"));
})
app.get("/aupdate", (req, res) => {
    res.sendFile(path.join(__dirname + "/views/updateappointment.html"));
})
app.get("/givepermi", (req, res) => {
    res.sendFile(path.join(__dirname + "/views/givepermission.html"));
})
app.get("/revokepermi", (req, res) => {
    res.sendFile(path.join(__dirname + "/views/revokepermi.html"));
})
app.get("/pdashboard", (req, res) => {
    res.sendFile(path.join(__dirname + "/views/patientdshbrd.html"));
})
app.get("/ddashboard", (req, res) => {
    res.sendFile(path.join(__dirname + "/views/docdashbrd.html"));
})
const server = app.listen(6988);
const portNumber = server.address().port;
console.log(`port is open on ${portNumber}`);