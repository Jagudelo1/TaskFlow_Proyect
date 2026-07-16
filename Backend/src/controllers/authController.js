// Función para registrar usuarios
const register = async (req, res) => {
    res.json({ mensaje: "Estructura de Registro lista para mañana (Día 3)"});
};

// Función para iniciar sesión
const login = async (req, res) => {
    res.json({ mensaje: "Estructura de Login lista para mañana (Día 3)"});
};

module.exports = {
    register,
    login
};