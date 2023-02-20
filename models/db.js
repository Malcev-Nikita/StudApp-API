const mysql = require('mysql2');
const env = require('dotenv').config();

const connection = mysql.createConnection({
    port: process.env.PORT_DB,
    user: process.env.USER_DB,
    host: process.env.HOST_DB,
    database: process.env.DATABASE_DB,
    password: process.env.PASSWORD_DB
});

connection.connect(err => {
    if (err) throw error;
    
    console.log("Успешно соединено с базой данных");
});

module.exports = connection;