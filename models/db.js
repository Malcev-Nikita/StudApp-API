const { Client } = require('pg'); 
const env = require('dotenv').config();

const client = new Client({
    user: process.env.USER_DB,
    host: process.env.HOST_DB,
    database: process.env.DATABASE_DB,
    password: process.env.PASSWORD_DB,
    port: process.env.PORT_DB,
});

client.connect(err => {
    if (err) throw error;
    
    console.log("Успешно соединено с базой данных");
});

module.exports = client;