const express = require("express");
const cors = require("cors");
const path = require("path");

const productRoutes = require("./routes/products.routes");
const UserRoutes = require("./routes/auth.routes");
const profileRoutes = require("./routes/profile.routes");
const favoriteRoutes = require("./routes/favorite.routes");
const CartRoutes = require("./routes/cart.routes");
const swaggerUi = require("swagger-ui-express");
const swaggerSpec = require("./config/swagger");
const orderRoutes = require("./routes/order.routes");
const paymentRoutes = require("./routes/payment.routes");

require("./models/products.model");
require("./models/user.model");
require("./models/favorite.model");
require("./models/cart.model");

const app = express();

app.use(cors());
app.use(express.json());

// Sirve las imágenes como archivos estáticos (ruta relativa y portable)
app.use("/images", express.static(path.join(__dirname, "../images")));

app.use("/api/products", productRoutes);
app.use("/api/auth", UserRoutes);
app.use("/api/user", profileRoutes);
app.use("/api/favorites", favoriteRoutes);
app.use("/api/cart", CartRoutes);
app.use("/api-docs", swaggerUi.serve, swaggerUi.setup(swaggerSpec));
app.use("/api/orders", orderRoutes);
app.use("/api/payments", paymentRoutes);
app.get("/", (req, res) => {
    res.redirect("/api-docs");
});

module.exports = app;