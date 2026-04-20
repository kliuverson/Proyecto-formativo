const express = require("express");
const cors = require("cors");
const path = require("path"); // agregar esto

const productRoutes = require("./routes/products.routes");
const UserRoutes = require("./routes/auth.routes");
const swaggerUi = require("swagger-ui-express");
const swaggerSpec = require("./config/swagger");

const app = express();

app.use(cors());
app.use(express.json());

//  agregar esto (sirve las imágenes como archivos estáticos)
app.use("/images", express.static("C:/Users/HP-255-G10/OneDrive/Imágenes/Proyecto-formativo/assets/images"));
console.log("servidor listo");

app.use("/api/products", productRoutes);
app.use("/api/auth", UserRoutes);
app.use("/api-docs", swaggerUi.serve, swaggerUi.setup(swaggerSpec));

app.get("/", (req, res) => {
    res.redirect("/api-docs");
});

module.exports = app;





