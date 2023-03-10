const Router = require('express');
const controller = require('../controllers/schedule_of_items.controller');

const router = new Router();

router.get('/get_all_items_of_group/:group', controller.GetAllItemsOfGroup)
router.get('/count_subject_day/:group', controller.CountSubjectDay)

module.exports = router;