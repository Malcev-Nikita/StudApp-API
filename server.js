require('dotenv').config();

const express = require("express");
const Schedule_Of_Items = require('./routes/schedule_of_items.routes')
const Students = require('./routes/students.routes')
const Call_Schedule = require('./routes/call_schedule.routes')

const app = express();

app.use(express.json());

app.use('/api', Schedule_Of_Items)
app.use('/api', Students)
app.use('/api', Call_Schedule)

app.listen(process.env.PORT_SERVER , () => console.log(`server started ${process.env.PORT_SERVER}`))