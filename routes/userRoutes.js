const express = require('express');
const router = express.Router();
const { addUser } = require('../db/addUser');
const { verifyUser } = require('../db/verifyUser');

// Route to add a new user
/*router.post('/addUser', async (req, res) => {
  const { username, email, password } = req.body;
  try {
    await addUser(username, email, password);
    res.status(201).json({ message: 'User added successfully!' });
  } catch (error) {
    console.error('Error adding user:', error);
    res.status(500).json({ error: 'Failed to add user.' });
  }
});

// Route to verify user credentials
/*router.post('/verifyUser', async (req, res) => {
  const { username, password } = req.body;
  try {
    const isVerified = await verifyUser(username, password);
    if (isVerified) {
      res.status(200).json({ message: 'User verified successfully!' });
    } else {
      res.status(401).json({ error: 'Invalid username or password.' });
    }
  } catch (error) {
    console.error('Error verifying user:', error);
    res.status(500).json({ error: 'Failed to verify user.' });
  }
});*/
/*router.post('/verifyUser ', async (req, res) => {
  try {
    const { username, password } = req.body;
    const result = await verifyUser (username, password);
    if (result.success) {
      res.status(200).json({ message: result.message });
    } else {
      if (result.error === 'User  not found!') {
        res.status(404).json({ error: result.error });
      } else {
        res.status(401).json({ error: result.error });
      }
    }
  } catch (error) {
    console.error('Error verifying user:', error.message);
    res.status(500).json({ error: 'Internal server error' });
  }
});



module.exports = router;*/

router.post('/addUser', async (req, res) => {
  try {
    const { username, email, password } = req.body;
    const result = await addUser (username, email, password);
    if (result.success) {
      res.status(201).json({ message: 'User added successfully!' });
    } else {
      res.status(400).json({ error: result.error });
    }
  } catch (error) {
    console.error('Error adding user:', error);
    res.status(500).json({ error: 'Failed to add user.' });
  }
});
  
router.post('/verifyUser', async (req, res) => {
  try {
    const { username, password } = req.body;
    const result = await verifyUser(username, password);

    if (result.success) {
      res.status(201).json({ message: 'User verified successfully!' });
    } else if (result.error === 'User not found!') {
      res.status(404).json({ error: result.error });
    } else if (result.error === 'Invalid username or password.') {
      res.status(401).json({ error: result.error });
    } else {
      res.status(500).json({ error: 'Unknown error occurred.' });
    }
  } catch (error) {
    console.error('Error verifying user:', error.message);
    res.status(500).json({ error: 'Internal server error' });
  }
});
  
module.exports = router;
