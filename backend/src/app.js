const express = require("express");

const productRoutes = require("./routes/products.routes");

const swaggerUi = require("swagger-ui-express");

const swaggerSpec = require("./config/swagger");

const app = express();

app.use(express.json());

app.use("/api/products", productRoutes);

app.use("/api-docs", swaggerUi.serve, swaggerUi.setup(swaggerSpec));

app.get("/", (req, res)=>{
    res.redirect("/api-docs");
});

module.exports = app;