const express = require('express');
const Database = require('better-sqlite3');
const path = require('path');

const app = express();
const db = new Database('mi_base.db');

app.use(express.json());
app.use(express.static(path.join(__dirname, 'public')));

db.prepare(`
  CREATE TABLE IF NOT EXISTS usuarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL
  )
`).run();

// --- 1. RUTA PARA AGREGAR DATOS (POST) ---
app.post('/api/agregar', (req, res) => {
  try {
    const { nombre } = req.body;
    
    if (!nombre || nombre.trim() === '') {
      return res.status(400).json({ error: 'El nombre no puede estar vacío.' });
    }

    const stmt = db.prepare('INSERT INTO usuarios (nombre) VALUES (?)');
    stmt.run(nombre);

    res.status(200).json({ mensaje: '¡Dato guardado con éxito en la base de datos!' });
  } catch (error) {
    res.status(500).json({ error: 'Error al guardar en la base de datos.' });
  }
});

// --- 2. RUTA PARA EXTRAER DATOS (GET) ---
app.get('/api/obtener', (req, res) => {
  try {
    const stmt = db.prepare('SELECT * FROM usuarios');
    const usuarios = stmt.all(); // Extrae todos los registros
    res.status(200).json(usuarios);
  } catch (error) {
    res.status(500).json({ error: 'Error al extraer los datos.' });
  }
});

app.listen(3000, () => {
  console.log('Servidor corriendo en http://localhost:3000');
});