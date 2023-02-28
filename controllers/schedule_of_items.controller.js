const db = require('../context');

class Schedule_Of_Items {

    async CreateStudent(req, res) {

    }

    async GetAllItemsOfGroup(req, res) {
        const group = req.params.group
        db.query(`SELECT * FROM Schedule_Of_Items WHERE Id_Group = ${group}`, (error, result, fields) => res.json(result))

        db.end();
    }

    async GetStudent(req, res) {
        
    }

    async UpdateStudent(req, res) {
        
    }

    async DeleteStudent(req, res) {
        
    }
}

module.exports = new Schedule_Of_Items();