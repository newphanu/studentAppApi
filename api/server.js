const express = require('express')
const bodyParser = require('body-parser')
const cors = require("cors");
const app = express()
const jwt = require('jsonwebtoken');
const SECRET_KEY = '123456';
const port = 3001

const knex = require("knex")({
    client: "mysql",
    connection: {
        host: "localhost",
        port: 3306,
        user: "root",
        password: "",
        database: "studentcheck",
    },
});

app.use(bodyParser.json());
app.use(cors());

app.post('/insertRoom', async (req, res) => {
    console.log(req.body)
    try {
        let insert = await knex('group')
        .insert({roomID: req.body.roomID, branchID: req.body.branchID, depID: req.body.depID})

        res.send({status:1})
    } catch (error) {
        res.send({status:0})
    }
})

// app.get('/listDateStudent', async (req, res) => {
//     try {
//         console.log('date = ', req.query)
//         let row = await knex('date');
//         res.send({
//             'status': 'ok',
//             datas: row
//         })
//     } catch (error) {
//         res.send({ ok: 0, error: error.messege });
//     }
// })

app.get('/listStudent', async (req, res) => {
    const { groupID } = req.query
    console.log('groupID:', groupID)
    try {
        const students = await knex('students').where('groupID', groupID)
        res.json(students)
    } catch (error) {
        console.error('error', error)
        res.status(500).json({ error: 'error' })
    }
});


app.post('/addDate', async (req, res) => {
    console.log(req.body)
    try {
        let date = await knex('date')
            .insert({ date: req.body.date })
        res.send({
            status: 1,
            message: 'insert success'
        })
    } catch (error) {
        res.send({ status: 0, error: error.messege });
    }
})

app.post('/addStudent', async (req, res) => {
    console.log(req.body)
    try {
        let data = await knex('students')
        .insert({
            stdUserName: req.body.studentid,
            stdPass: req.body.id,
            stdFirstName: `${req.body.title}${req.body.fname}`,
            stdLastName: req.body.lname,
            statusID: 1,
            groupID: req.body.groupID
        })
        res.send({ status: 1, message: 'insert ok'})
    } catch (error) {
        res.send({ status: 0, error: error.messege });
    }
})

app.post('/doLogin', async (req, res) => {
    console.log(req.body);
    let users = await knex('students')
        .where({ stdUserName: req.body.username, stdPass: req.body.password });
        console.log(users);

    if (users.length > 0) {
        let role = users[0].statusID;

        let data = {
            username: req.body.username,
            stdFirstName: users[0].stdFirstName
        };

        const token = jwt.sign(
            { stdUserName: users[0].stdUserName, statusID: users[0].statusID },
            SECRET_KEY,
            { expiresIn: "1h" }
        );

        return res.send({
            token,
            message: 'Login success',
            status: 'success',
            statusID: role,
            data: data
        });
    }

    users = await knex('teachers')
        .where({ teacherUserName: req.body.username, teacherPass: req.body.password });

    if (users.length > 0) {
        let role = users[0].statusID;

        let data = {
            username: req.body.username,
            teacherFirstName: users[0].teacherFirstName
        };

        const token = jwt.sign(
            { teacherUserName: users[0].teacherUserName, statusID: users[0].statusID },
            SECRET_KEY,
            { expiresIn: "1h" }
        );

        return res.send({
            token,
            message: 'Login success',
            status: 'success',
            statusID: role,
            data: data
        });
    }

    users = await knex('admins')
        .where({ adminUserName: req.body.username, adminPass: req.body.password });

    if (users.length > 0) {
        let role = users[0].statusID;

        let data = {
            username: req.body.username,
            adminUserName: users[0].adminUserName
        };

        const token = jwt.sign(
            { adminUserName: users[0].adminUserName, statusID: users[0].statusID },
            SECRET_KEY,
            { expiresIn: "1h" }
        );

        return res.send({
            token,
            message: 'Login success',
            status: 'success',
            statusID: role,
            data: data
        });
    }

    return res.send({
        message: 'Wrong username or password.',
        status: 'fail',
    });
});

// Middleware สำหรับตรวจสอบ JWT Token
function authenticateToken(req, res, next) {
    const tokenheader = req.headers['authorization'];
    const token = tokenheader.split(' ')[1];
    
    console.log('token = ',token)
    if (!token) {
    return res.status(403).json({ message: 'No token provided' });
    }

    jwt.verify(token, SECRET_KEY, (err, decoded) => {
    if (err) {
        return res.status(403).json({ 
        message: 'Invalid token',
        status: 0 
        });
    }
    req.user = decoded;
    next();
    });
}

// Route ที่ต้องมีการยืนยันตัวตน (Protected Route)
app.get('/checkToken', authenticateToken, (req, res) => {
    res.json({ 
    message:'token correct',
    status: 1
    });
});

app.get('/name', async (res) => {
    try {
        let name = await knex('students');
    } catch (error) {

    }
});

app.get('/getRoomName', async (req, res) => {
    try {
        const data = await knex('group')
            .join('room', 'group.roomID', '=', 'room.roomID')
            .select('room.roomName');

        if (!data.length) {
            return res.status(404).json({ error: 'No data found' });
        }

        res.json(data);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

app.get('/getGroup', async (req, res) => {
    try {
        const data = await knex('group')
        .select('group.groupID');
        
        res.json(data);
    } catch (error) {
        console.error('Error fetching group data:', error);
        res.status(500).json({ error: 'Failed to fetch group data' });
    }
});

app.get('/getDepName', async (req, res) => {
    try {
        const data = await knex('group')
            .join('department', 'group.depID', '=', 'department.depID')
            .select('department.depName');

        // if (!data.length) {
        //     return res.status(404).json({ error: 'No data found' });
        // }

        res.json(data);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`);
});