const express = require('express');
const sqlite3 = require('sqlite3').verbose();
const cors = require('cors');

const app = express();
const PORT = 3333;

// Middleware
app.use(express.json());
app.use(cors());

// Connect to SQLite database
const db = new sqlite3.Database('./mydb.db', (err) => {
    if (err) {
        console.error('Error connecting to database', err);
    } else {
        console.log('Connected to SQLite database');
    }
});


// Login endpoint
app.post('/api/login', (req, res) => {
    const { email, password } = req.body;
    console.log('Login request:', email, password);
    const sql = `SELECT * FROM users WHERE email = ?`;
    db.get(sql, [email], (err, user) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }
        if (!user || user.password !== password) {
            return res.status(401).json({ error: 'Invalid email or password' });
        }
        res.json({ message: 'Login successful', status: 'success', token: email });
    });
});

// Get employees endpoint
app.get('/api/details/:token', (req, res) => {
    const token = req.params.token;
    console.log('Token:', token);
    const sql = `SELECT * FROM details WHERE email = ?`;
    db.get(sql, [token], (err, user) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }
        user.goals = JSON.parse(user.goals.replace(/'/g, '"'));
        user.feedback = JSON.parse(user.feedback.replace(/'/g, '"'));
        user.CustomerRating = JSON.parse(user.CustomerRating.replace(/'/g, '"'));
        user.ManagersOverallRating = JSON.parse(user.ManagersOverallRating.replace(/'/g, '"'));
        user.TrainingSuggested = JSON.parse(user.TrainingSuggested.replace(/'/g, '"'));
        user.Incentives = JSON.parse(user.Incentives.replace(/'/g, '"'));
        user.TrainingsReceived = JSON.parse(user.TrainingsReceived.replace(/'/g, '"'));
        user.Competencies = JSON.parse(user.Competencies.replace(/'/g, '"'));
        res.json({ email: user.email, name: user.name, phoneNo: user.phoneNo, address: user.address, role: user.role, department: user.department,
            managerName: user.managerName, jobLocation: user.jobLocation, goals: user.goals, experience: user.experience,
            feedback: user.feedback, KPI: user.KPI, KRA: user.KRA, CustomerRating: user.CustomerRating, 
            ManagersOverallRating: user.ManagersOverallRating, TrainingSuggested: user.TrainingSuggested, Incentives: user.Incentives,
            TrainingsReceived: user.TrainingsReceived, Competencies: user.Competencies});
    });
});

app.get('/api/details', (req, res) => {
    const sql = `SELECT * FROM details`;
    db.all(sql, [], (err, rows) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }

        // Process each row to parse the goals and feedback fields
        const users = rows.map(user => {
            user.goals = JSON.parse(user.goals.replace(/'/g, '"'));
            user.feedback = JSON.parse(user.feedback.replace(/'/g, '"'))
            user.Competencies = JSON.parse(user.Competencies.replace(/'/g, '"'))
            user.CustomerRating = JSON.parse(user.CustomerRating.replace(/'/g, '"'))
            return user;
        });

        res.json(users);
    });
});

app.get('/api/highest-rated-employee', (req, res) => {
    const sql = `
    SELECT * FROM details 
    WHERE CustomerRating = (SELECT MAX(CustomerRating) FROM details);
`;

    db.all(sql, [], (err, rows) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }

        // Process each row to parse necessary fields
        const users = rows.map(user => {
            try {
                user.CustomerRating = JSON.parse(user.CustomerRating.replace(/'/g, '"'));
            } catch (error) {
                console.error('Error parsing JSON fields:', error);
            }
            return user;
        });

        res.json(users);
    });
});


//update goals
app.put('/api/details/addGoals/:email', (req, res) => {
    const email = req.params.email;
    const { goals } = req.body;

    // Fetch existing goals
    const fetchSql = `SELECT goals FROM details WHERE email = ?`;
    db.get(fetchSql, [email], (err, row) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }

        let existingGoals = [];
        if (row && row.goals) {
            existingGoals = JSON.parse(row.goals.replace(/'/g, '"'));
        }
        console.log(goals)
        // Merge existing goals with new goals
        existingGoals.push(goals)

        // Update the goals in the database
        const updateSql = `UPDATE details SET goals = ? WHERE email = ?`;
        db.run(updateSql, [JSON.stringify(existingGoals), email], function(err) {
            if (err) {
                return res.status(500).json({ error: err.message });
            }
            res.json({ message: 'Goals updated successfully', changes: this.changes, status: '200' });
        });
    });
});

app.put('/api/details/updateAllGoals/:email', (req, res) => {
    const email = req.params.email;
    const { goals } = req.body;
    console.log(goals);

    // Update the goals in the database
    const updateSql = `UPDATE details SET goals = ? WHERE email = ?`;
    db.run(updateSql, [JSON.stringify(goals), email], function(err) {
        if (err) {
            return res.status(500).json({ error: err.message });
        }
        res.json({ message: 'Goals updated successfully', changes: this.changes, status: '200' });
    });
});


//update feedback
app.put('/api/details/addFeedback/:email', (req, res) => {
    const email = req.params.email;
    const { feedback, managersRating } = req.body;

    // Fetch existing feedback
    const fetchSql = `SELECT feedback and ManagersOverallRating FROM details WHERE email = ?`;
    db.get(fetchSql, [email], (err, row) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }

        let existingFeedback = [];
        if (row && row.feedback) {
            existingFeedback = JSON.parse(row.feedback.replace(/'/g, '"'));
        }
        
        console.log(feedback)
        // Merge existing goals with new goals
        existingFeedback.push(feedback)
        let updatedManagersRating = [managersRating]
        console.log(existingFeedback, updatedManagersRating);
        // Update the goals in the database
        const updateSql = `UPDATE details SET feedback = ?, ManagersOverallRating = ? WHERE email = ?`;
        db.run(updateSql, [JSON.stringify(existingFeedback), JSON.stringify(updatedManagersRating), email], function(err) {
            if (err) {
                return res.status(500).json({ error: err.message });
            }
            res.json({ message: 'Feedback updated successfully', changes: this.changes, status: '200' });
        });
    });
});

app.put('/api/details/addTraining/:email', (req, res) => {
    const email = req.params.email;
    const { training } = req.body;

    // Fetch existing feedback
    const fetchSql = `SELECT TrainingSuggested FROM details WHERE email = ?`;
    db.get(fetchSql, [email], (err, row) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }

        let existingTraining = [];
        if (row && row.TrainingSuggested) {
            existingTraining = JSON.parse(row.TrainingSuggested.replace(/'/g, '"'));
        }
        
        // Merge existing goals with new goals
        existingTraining.push(training)
        // Update the goals in the database
        const updateSql = `UPDATE details SET TrainingSuggested = ? WHERE email = ?`;
        db.run(updateSql, [JSON.stringify(existingTraining), email], function(err) {
            if (err) {
                return res.status(500).json({ error: err.message });
            }
            res.json({ message: 'Feedback updated successfully', changes: this.changes, status: '200' });
        });
    });
});

app.get('/api/managers/:token', (req, res) => {
    const token = req.params.token;
    console.log('Token:', token);
    const sql = `SELECT * FROM managers WHERE email = ?`;
    db.get(sql, [token], (err, user) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }
        user.employees = JSON.parse(user.employees.replace(/'/g, '"'));
        res.json({ email: user.email, name: user.name, phoneNo: user.phoneNo, address: user.address, department: user.department,
            jobLocation: user.jobLocation, employees: user.employees });
    });
});

// Start server
app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});
