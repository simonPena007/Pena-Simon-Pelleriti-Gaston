# Manual: Conectores de bases de datos

* **Nombre:** Gastón Pelleriti y Simón Peña
* **Curso:** 4° 9°
* **Asignatura:** Sistema de Información

---

## 1. ¿Qué es un conector de base de datos y por qué existe?

* **Qué es:** Es una librería o paquete de software que actúa como puente de comunicación entre tu aplicación (escrita en JavaScript) y el motor de la base de datos (como SQLite, MySQL o PostgreSQL).
* **Por qué existe:** Las bases de datos y los lenguajes de programación utilizan protocolos y estructuras distintas. El conector traduce las consultas que haces en tu código a comandos que la base de datos entiende, y viceversa, transformando los resultados en objetos o arreglos que JavaScript puede manipular fácilmente.

---

## 2. Cómo se configura un proyecto real con Node.js y Express

Para poner en marcha un entorno de desarrollo backend básico, sigues estos pasos principales:

1. **Inicializar el proyecto:** Ejecutas `npm init -y` en tu terminal para crear el archivo `package.json` que gestiona las dependencias.
2. **Instalar dependencias:** Instalas frameworks y herramientas necesarias, por ejemplo:
   * `express`: Para crear el servidor web y manejar rutas HTTP.
   * Un driver de base de datos (como `better-sqlite3` o `sqlite3`).
3. **Estructura básica del servidor:** En un archivo principal (ej. `server.js`), importas Express, configuras la aplicación para que acepte formato JSON (`express.json()`), defines archivos estáticos si es necesario, y pones el servidor a escuchar en un puerto específico (por ejemplo, `app.listen(3000)`).

---

## 3. Cómo se crea una tabla en SQLite y cómo se insertan datos

SQLite es una base de datos ligera y basada en archivos locales ideal para proyectos pequeños o de aprendizaje.

* **Crear una tabla:** Se utiliza SQL dentro del código de Node.js al iniciar la app.
  ```sql
  CREATE TABLE IF NOT EXISTS usuarios (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nombre TEXT NOT NULL,
      email TEXT UNIQUE
  );