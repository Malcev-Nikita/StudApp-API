const Router = require('express');
const controller = require('../controllers/students.controller');

const router = new Router();

router.get('/check_user/:login/:password', controller.CheckUser)

module.exports = router;