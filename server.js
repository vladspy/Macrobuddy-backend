require('dotenv').config(); // Load environment variables
const { connectDB } = require('./db/db'); // Import the DB module
const path = require('path'); 

const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors'); // Import CORS
const userRoutes = require('./routes/userRoutes');
const macrosRoutes = require('./routes/macrosRoutes');
const PIRoutes = require('./routes/PIRoutes');

const app = express();
const PORT = process.env.PORT; // Use environment variable for port
app.use(express.static(path.join(__dirname, 'frontend')));

// Middleware
app.use(cors({
  origin: 'http://127.0.0.1:5500', // Allow requests from this origin
  methods: ['GET', 'POST'],
  allowedHeaders: ['Content-Type']
}));
app.use(express.json());
app.use(bodyParser.json());

// Routes
app.use('/api/users', userRoutes);
app.use('/api/macros', macrosRoutes);
app.use('/api/personal-info', PIRoutes);
console.log("Personal Info Routes loaded!");

// Default route
app.get('/', (req, res) => {
  res.send('Welcome to MacroBuddy API!');
});

// Start server
app.listen(PORT, 'localhost', () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
module.exports = app;
