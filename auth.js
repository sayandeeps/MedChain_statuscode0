// auth.js

const express = require('express');
const { auth } = require('express-openid-connect');

const config = {
    authRequired: false,
    auth0Logout: true,
    secret: 'SET_YOUR_SECRET',
    baseURL: 'http://localhost:8080',
    clientID: 'YOUR_CLIENT_ID',
    issuerBaseURL: 'https://YOUR_AUTH0_DOMAIN'
};

const authRouter = express.Router();

authRouter.use(
    auth(config)
);

authRouter.get('/profile', (req, res) => {
    res.send(JSON.stringify(req.oidc.user));
});

module.exports = authRouter;