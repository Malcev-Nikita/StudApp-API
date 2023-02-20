const express = require("express");
const app = express();
const env = require('dotenv').config();
const bodyParser = require('body-parser');
const globalRoutes = require('./routes/global.routes')
const userRoutes = require('./routes/users.routes')


app.use(bodyParser.json());

app.use(bodyParser.urlencoded({
    extended: true,
}));


globalRoutes(app);
userRoutes(app);


const server = app.listen(process.env.PORT_SERVER, (error) => {
    if (error) return console.log(`Error: ${error}`);

    console.log(`Server listening on port ${process.env.PORT_SERVER}`);
});