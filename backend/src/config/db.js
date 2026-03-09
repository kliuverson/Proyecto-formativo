const mongoose = require("mongoose");

const connectDB = async () => {
    try{
        await mongoose.connect("mongodb://localhost:27017");
        console.log("Conexion exitosa con la base de datos");
    }catch (error) {
        console.error("Error conectando a la base de datos: ", error.message);
        process.exit(1);
    }
};

module.exports = connectDB;