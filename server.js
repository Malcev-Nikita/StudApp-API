const express = require("express");
const app = express();
const env = require('dotenv').config();
// const bodyParser = require('body-parser');
// const globalRoutes = require('./routes/global.routes')
// const StudentsRoutes = require('./routes/students.routes')
const Schedule_Of_Items = require('./routes/schedule_of_items.routes')

app.use(express.json());

app.use('/api', Schedule_Of_Items)

app.listen(process.env.PORT, () => console.log('server started'))

// app.use(bodyParser.urlencoded({
//     extended: true,
// }));


// globalRoutes(app);
// StudentsRoutes(app);


// const server = app.listen(process.env.PORT_SERVER, (error) => {
//     if (error) return console.log(`Error: ${error}`);

//     console.log(`Server listening on port ${process.env.PORT_SERVER}`);
// });