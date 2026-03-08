const express = require("express");

const app = express();

app.get("/", (req, res)=>{
    res.send("API de Ferremateriales funcionando 🚀👌 ");
});

module.exports = app;