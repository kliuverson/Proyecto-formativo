const express = require("express");

const productRoutes = require("./routes/products.routes");

const app = express();

app.use(express.json());

app.use("/api/products", productRoutes);

app.get("/", (req, res)=>{
    res.send("API de Ferremateriales funcionando 🚀👌 ");
});

module.exports = app;