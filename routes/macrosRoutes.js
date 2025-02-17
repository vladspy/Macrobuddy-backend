// routes/macrosRoutes.js

const express = require('express');
const router = express.Router();
const Joi = require('joi');
const { addMacro, getMacros } = require('../db/macros');

// Validation schema for adding macros
const addMacrosSchema = Joi.object({
  userId: Joi.number().integer().required(),
  protein: Joi.number().required(),
  carbs: Joi.number().required(),
  fats: Joi.number().required(),
  calories: Joi.number().required(),
});

// Validation schema for getting macros
const getMacrosSchema = Joi.object({
  userId: Joi.number().integer().required(),
});

router.post('/addMacros', async (req, res) => {
  // Validate input
  const { error, value } = addMacrosSchema.validate(req.body);
  if (error) {
    return res.status(400).json({ error: error.details[0].message });
  }

  const { userId, protein, carbs, fats, calories } = value;
  try {
    await addMacro(userId, { protein, carbs, fats, calories });
    res.status(201).json({ message: 'Macros added successfully!' });
  } catch (err) {
    console.error('Error adding macros:', err.message);
    // If user doesn't exist, or DB error
    return res.status(400).json({ error: err.message });
  }
});

router.get('/getMacros', async (req, res) => {
  // Validate query
  const { error, value } = getMacrosSchema.validate(req.query);
  if (error) {
    return res.status(400).json({ error: error.details[0].message });
  }

  const { userId } = value;
  try {
    const macroData = await getMacros(userId);
    if (!macroData || macroData.length === 0) {
      return res.status(404).json({ error: 'No macro data found for the given user.' });
    }
    res.status(200).json(macroData);
  } catch (err) {
    console.error('Error retrieving macros:', err.message);
    res.status(500).json({ error: 'Internal server error while retrieving macros.' });
  }
});

module.exports = router;
