const mongoose = require("mongoose");
require("dotenv").config();
const Product = require("../models/products.model");

const products = [
  // =========================
  // BAÑOS
  // =========================
  {
    sku: "BAN-001",
    nombre: "Lavamanos Blanco Cerámico",
    descripcion: "Lavamanos moderno para baño",
    precio: 180000,
    stock: 8,
    category: "Baños",
    image: "/images/productos/lavamanos.jpg"
  },
  {
    sku: "BAN-002",
    nombre: "Sanitario One Piece",
    descripcion: "Sanitario ahorrador de agua",
    precio: 450000,
    stock: 5,
    category: "Baños",
    image: "/images/productos/sanitario.jpg"
  },
  {
    sku: "BAN-003",
    nombre: "Ducha Eléctrica",
    descripcion: "Ducha eléctrica de alta potencia",
    precio: 120000,
    stock: 10,
    category: "Baños",
    image: "/images/productos/ducha-electrica.jpg"
  },
  {
    sku: "BAN-004",
    nombre: "Espejo para Baño",
    descripcion: "Espejo rectangular moderno",
    precio: 95000,
    stock: 12,
    category: "Baños",
    image: "/images/productos/espejo-bano.jpg"
  },
  {
    sku: "BAN-005",
    nombre: "Grifería Monomando",
    descripcion: "Grifo cromado para lavamanos",
    precio: 160000,
    stock: 7,
    category: "Baños",
    image: "/images/productos/griferia.jpg"
  },

  // =========================
  // PISOS
  // =========================
  {
    sku: "PIS-001",
    nombre: "Cerámica Beige 60x60",
    descripcion: "Piso cerámico brillante",
    precio: 55000,
    stock: 40,
    category: "Pisos",
    image: "/images/productos/ceramica-beige.jpg"
  },
  {
    sku: "PIS-002",
    nombre: "Porcelanato Gris",
    descripcion: "Porcelanato de alto tráfico",
    precio: 89000,
    stock: 30,
    category: "Pisos",
    image: "/images/productos/porcelanato-gris.jpg"
  },
  {
    sku: "PIS-003",
    nombre: "Piso Laminado Roble",
    descripcion: "Piso laminado resistente",
    precio: 75000,
    stock: 25,
    category: "Pisos",
    image: "/images/productos/piso-laminado.jpg"
  },
  {
    sku: "PIS-004",
    nombre: "Pegante para Cerámica",
    descripcion: "Pegante de alta resistencia",
    precio: 38000,
    stock: 20,
    category: "Pisos",
    image: "/images/productos/pegante-ceramica.jpg"
  },
  {
    sku: "PIS-005",
    nombre: "Boquilla para Piso Blanca",
    descripcion: "Boquilla impermeable",
    precio: 18000,
    stock: 50,
    category: "Pisos",
    image: "/images/productos/boquilla.jpg"
  },

  // =========================
  // CONSTRUCCIÓN
  // =========================
  {
    sku: "CON-001",
    nombre: "Cemento Gris 50kg",
    descripcion: "Cemento de alta resistencia",
    precio: 42000,
    stock: 60,
    category: "Construcción",
    image: "/images/productos/cemento.jpg"
  },
  {
    sku: "CON-002",
    nombre: "Bloque #4",
    descripcion: "Bloque estructural",
    precio: 2500,
    stock: 300,
    category: "Construcción",
    image: "/images/productos/bloque.jpg"
  },
  {
    sku: "CON-003",
    nombre: "Varilla Corrugada 3/8",
    descripcion: "Varilla para construcción",
    precio: 38000,
    stock: 45,
    category: "Construcción",
    image: "/images/productos/varilla.jpg"
  },
  {
    sku: "CON-004",
    nombre: "Arena Fina",
    descripcion: "Arena para acabados",
    precio: 15000,
    stock: 100,
    category: "Construcción",
    image: "/images/productos/arena.jpg"
  },
  {
    sku: "CON-005",
    nombre: "Carretilla Metálica",
    descripcion: "Carretilla reforzada",
    precio: 210000,
    stock: 6,
    category: "Construcción",
    image: "/images/productos/carretilla.jpg"
  },

  // =========================
  // ELECTRICIDAD
  // =========================
  {
    sku: "ELE-001",
    nombre: 'Cable THW #12',
    descripcion: 'Cable eléctrico 100m',
    precio: 320000,
    stock: 15,
    category: 'Electricidad',
    image: '/images/productos/cable-thw.jpg'
  },
  {
    sku: "ELE-002",
    nombre: "Interruptor Sencillo",
    descripcion: "Interruptor de pared",
    precio: 12000,
    stock: 40,
    category: "Electricidad",
    image: "/images/productos/interruptor.jpg"
  },
  {
    sku: "ELE-003",
    nombre: "Tomacorriente Doble",
    descripcion: "Toma corriente polarizado",
    precio: 15000,
    stock: 35,
    category: "Electricidad",
    image: "/images/productos/tomacorriente.jpg"
  },
  {
    sku: "ELE-004",
    nombre: "Breaker 20A",
    descripcion: "Breaker monopolar",
    precio: 28000,
    stock: 18,
    category: "Electricidad",
    image: "/images/productos/breaker.jpg"
  },
  {
    sku: "ELE-005",
    nombre: "Panel LED 18W",
    descripcion: "Panel LED de techo",
    precio: 45000,
    stock: 22,
    category: "Electricidad",
    image: "/images/productos/panel-led.jpg"
  }
];

const seedProducts = async () => {
  try {
    await mongoose.connect(process.env.MONGO_URI);

    console.log("MongoDB conectado");

    await Product.deleteMany();

    console.log("Productos eliminados");

    await Product.insertMany(products);

    console.log("Productos insertados correctamente");

    mongoose.connection.close();

  } catch (error) {
    console.error(error);
  }
};

seedProducts();