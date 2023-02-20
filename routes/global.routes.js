const controller = require('../controllers/global.controller')

const router = app => {
    app.get('/', controller.startPage);
}

module.exports = router;