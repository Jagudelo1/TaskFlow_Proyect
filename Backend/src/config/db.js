const mysql = require('mysql2');
require('dotenv').config(); //Carga las variables del archivo .env

// Crear un 'Pool' de conexiones (Gestor inteligente de conexiones simultánea)
const pool = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    waitForConnections: true,
    connectionLimit: 10, //Máximo de conexiones abiertas al mismo tiempo
    queueLimit: 0
});

//Convertir el pool para que soporte 'Promesas' (permite usar async/await en el backend)
const db = pool.promise();

//Exportar la conexión para poder usarla en los controladores de Login y Registro
module.exports = db;