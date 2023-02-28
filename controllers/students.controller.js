const db = require('../context');

class Students {

    async GetAllStudents(req, res) {
        const group = req.params.group
        db.query(`SELECT * FROM Students WHERE Id_Group = ${group}`, (error, result, fields) => res.json(result))

        db.end();
    }
}

module.exports = new Students();