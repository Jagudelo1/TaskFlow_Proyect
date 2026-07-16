const express = require('express');
const cors = require('cors');
require('dotenv').config();

const app = express();

// Middlewares (Configuraciones de seguridad y lectura de datos)
app.use(cors()); // Permite peticiones externas (para conectar frontend)
app.use(express.json()); // Permite que el servidor entienda datos en formato JSON

// Conectamos las nuevas rutas de autenticación
const authRoutes = require('./routes/authRoutes');
app.use('/api', authRoutes); // esto hará que tus URLs sean /api/register y /api/login

// Ruta de prueba inicial para verificar en el navegador o Postman
app.get('/', (req, res) =>{
    res.json({mensaje: '¡API de TaskFlow corriendo con éxito!'});
});

// Levantamos el servidor escuchando en el puerto definido
const PORT = process.env.PORT || 300;
app.listen(PORT, () =>{
    console.log(`============================`);
    console.log(`servidor corriendo con éxito en el puerto ${PORT}`);
    console.log(`============================`);
});