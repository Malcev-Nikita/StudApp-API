const Router = require('express');
const router = new Router();
const controller = require('../controllers/schedule_of_items.controller');

// router.post('/api/create_student', controller.CreateStudent)
router.get('/get_all_items_of_group/:group', controller.GetStudents)
// router.get('/api/get_student/:id', controller.GetStudent)
// router.put('/api/update_student', controller.UpdateStudent)
// router.delete('/api/delete_student/:id', controller.DeleteStudent)

module.exports = router;