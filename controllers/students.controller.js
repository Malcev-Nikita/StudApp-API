const db = require('../context');

class Students {

    async CheckUser(req, res) {
        const login = req.params.login
        const password = req.params.password
        
        const request = `SELECT * FROM Users 
                            WHERE Login = '${login}' AND Password = '${password}'`

                                
        db.query(request, (error, result, fields) => res.json(result))
    }
}

module.exports = new Students();