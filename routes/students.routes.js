const Router = require('express');
const controller = require('../controllers/students.controller');

const router = new Router();

router.get('/get_all_students/:group', controller.GetAllStudents)

module.exports = router;