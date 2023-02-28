const Router = require('express');
const controller = require('../controllers/schedule_of_items.controller');

const router = new Router();

router.get('/get_all_items_of_group/:group', controller.GetAllItemsOfGroup)

module.exports = router;