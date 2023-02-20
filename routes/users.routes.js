const controller = require('../controllers/users.controller')

const router = app => {

    app.get('/api/users', controller.getAllUser);

    app.get('/api/users/:id', controller.getUserById);

    app.post('/api/users', controller.postNewUser);

    app.put('/api/users/:id', controller.putUserById);

    app.delete('/api/users/:id', controller.deleteUserById);
}

module.exports = router;