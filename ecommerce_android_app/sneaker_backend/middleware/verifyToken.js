const jwt = require("jsonwebtoken");
const User = require('../models/User');


const verifyToken = (req, res, next) => {
    const authHeader = req.headers.token;

    if (authHeader) {
        const token = authHeader || authHeader.split(" ")[1];
        jwt.verify(token, process.env.JWT_SEC, (err, user) => {

            if (err) {
                if (err.name === 'TokenExpiredError') {
                    return res.status(401).json({ error: 'Token has expired' });
                } else {
                    return res.status(403).json({ error: 'Invalid token' });
                }
            }
            req.user = user;
            next();
        });


    } else {
        return res.status(401).json('You are not authenticated')
    }
}

module.exports = { verifyToken };