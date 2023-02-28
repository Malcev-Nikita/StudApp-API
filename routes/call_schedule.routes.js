const Router = require('express');
const controller = require('../controllers/call_schedule.controller');

const router = new Router();

router.get('/get_all_call_schedule', controller.GetAllCallSchedule)

module.exports = router;