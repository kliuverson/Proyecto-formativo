const express = require("express");
const cors = require("cors");
const path = require("path");

const productRoutes = require("./routes/products.routes");
const UserRoutes = require("./routes/auth.routes");
const profileRoutes = require("./routes/profile.routes");
const favoriteRoutes = require("./routes/favorite.routes");
const CartRoutes = require("./routes/cart.routes");
const addressRoutes = require("./routes/address.routes");

const swaggerUi = require("swagger-ui-express");
const swaggerSpec = require("./config/swagger");

const orderRoutes = require("./routes/order.routes");
const paymentRoutes = require("./routes/payment.routes");
const dashboardRoutes = require("./routes/dashboard.routes");

require("./models/products.model");
require("./models/user.model");
require("./models/favorite.model");
require("./models/cart.model");
require("./models/address.model");

const app = express();

app.use(cors());

app.use(express.json());

/// IMÁGENES
app.use(
  "/images",
  express.static(path.join(__dirname, "../images"))
);

/// RUTAS
app.use("/api/products", productRoutes);

app.use("/api/auth", UserRoutes);

app.use("/api/user", profileRoutes);

app.use("/api/favorites", favoriteRoutes);

app.use("/api/cart", CartRoutes);

app.use("/api/address", addressRoutes);

app.use("/api/orders", orderRoutes);

app.use("/api/payments", paymentRoutes);

app.use("/api/dashboard", dashboardRoutes);

/// SWAGGER
app.use(
  "/api-docs",
  swaggerUi.serve,
  swaggerUi.setup(swaggerSpec)
);

app.get("/", (req, res) => {
  res.redirect("/api-docs");
});

module.exports = app;