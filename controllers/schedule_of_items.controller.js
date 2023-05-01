const db = require('../context');

class Schedule_Of_Items {

    async CountSubjectDay(req, res) {
        const group = req.params.group
        const request = `SELECT (SELECT Name FROM Day_Of_Week WHERE Day_Of_Week_Id = Day_Of_Week.Id) AS "Day_Of_Week" 
                            FROM Schedule_Of_Items 
                                WHERE Id_Group = ${group}
                                    GROUP BY Day_Of_Week` 
                                
        db.query(request, (error, result, fields) => res.json(result))
    }

    async GetAllItemsOfGroup(req, res) {
        const group = req.params.group
        const request = `SELECT Id, 
                            (SELECT Name FROM Subject WHERE Id_Subject = Subject.Id) AS 'Subject', 
                            (SELECT Time_Start FROM Сall_Schedule WHERE Call_Schedule_Id = Сall_Schedule.Id) AS 'Time_Start',
                            (SELECT Time_End FROM Сall_Schedule WHERE Call_Schedule_Id = Сall_Schedule.Id) AS 'Time_End', 
                            (SELECT Full_Name FROM Users WHERE 
                            (SELECT Id FROM Users WHERE Teacher_Id = Users.Id) = Users.Id) AS 'Users', 
                            (SELECT Name FROM Group WHERE Group_Id = Group.Id) AS 'Group', 
                            (SELECT Name FROM Day_Of_Week WHERE Day_Of_Week_Id = Day_Of_Week.Id) AS 'Day_Of_Week', 
                            A_Week_In_A_Row 
                                FROM Schedule_Of_Items  
                                            WHERE Id_Group = ${group}`

        db.query(request, (error, result, fields) => res.json(result))
    }

    async GetStudent(req, res) {
        
    }

    async UpdateStudent(req, res) {
        
    }

    async DeleteStudent(req, res) {
        
    }
}

module.exports = new Schedule_Of_Items();