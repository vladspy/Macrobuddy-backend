require('dotenv').config(); // Load environment variables
const { connectDB } = require('./db/db'); // Import the DB module

const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors'); // Import CORS
const userRoutes = require('./routes/userRoutes');
const macrosRoutes = require('./routes/macrosRoutes');
const PIRoutes = require('./routes/PIRoutes');

const app = express();
const PORT = process.env.PORT; // Use environment variable for port

// Middleware
app.use(cors()); // Enable CORS
app.use(bodyParser.json());

// Routes
app.use('/api/users', userRoutes);
app.use('/api/macros', macrosRoutes);
app.use('/api/personal-info', PIRoutes);

// Default route
app.get('/', (req, res) => {
  res.send('Welcome to MacroBuddy API!');
});

// Start server
app.listen(PORT, 'localhost', () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
module.exports = app;
