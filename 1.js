const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');
const app = express();

app.use(bodyParser.json());

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'password',
    database: 'EventManagement'
});

db.connect(err => {
    if (err) throw err;
    console.log('MySQL connected...');
});

app.get('/api/events', (req, res) => {
    db.query('SELECT * FROM Events', (err, results) => {
        if (err) throw err;
        res.json(results);
    });
});

app.get('/api/event/:id', (req, res) => {
    const { id } = req.params;
    db.query('SELECT * FROM Events WHERE id = ?', [id], (err, result) => {
        if (err) throw err;
        res.json(result[0]);
    });
});

app.post('/api/register/:eventId', (req, res) => {
    const userId = 1; // Assuming a logged-in user with ID 1
    const { eventId } = req.params;
    db.query('INSERT INTO Registrations (user_id, event_id) VALUES (?, ?)', [userId, eventId], (err, result) => {
        if (err) throw err;
        res.json({ success: true });
    });
});

app.get('/api/user', (req, res) => {
    const userId = 1; // Assuming a logged-in user with ID 1
    db.query('SELECT * FROM Users WHERE id = ?', [userId], (err, result) => {
        if (err) throw err;
        res.json(result[0]);
    });
});

app.get('/api/user/registered-events', (req, res) => {
    const userId = 1; // Assuming a logged-in user with ID 1
    db.query('SELECT e.* FROM Events e INNER JOIN Registrations r ON e.id = r.event_id WHERE r.user_id = ?', [userId], (err, results) => {
        if (err) throw err;
        res.json(results);
    });
});

app.listen(3000, () => {
    console.log('Server started on port 3000');
});
