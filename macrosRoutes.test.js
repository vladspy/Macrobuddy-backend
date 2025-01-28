// macrosRoutes.test.js

const request = require('supertest');
const app = require('./server'); // <-- Adjust path if needed
const { addMacro, truncateMacros } = require('./db/macros');
const { expect } = require('chai');
const { connectDB } = require('./db/db');

describe('Macros Routes', () => {
  beforeEach(async () => {
    // Clear macros table
    await truncateMacros();

    // 1. Insert a user with user_id = 1, ensuring your real columns are used
    const connection = await connectDB();
    // If your user table has (user_id, username, email, hashed_password)
    await connection.execute(
      `INSERT IGNORE INTO user (user_id, username, email, hashed_password)
       VALUES (?, ?, ?, ?)`,
      [1, 'testuser', 'test@example.com', 'testhashedpassword']
    );
    connection.release();

    // 2. Add default macros so the user has an existing record
    await addMacro(1, { protein: 100, carbs: 200, fats: 50, calories: 500 });
  });

  afterEach(async () => {
    // Clear macros table again
    await truncateMacros();
    console.log(`truncated`);
  });

  it('should add new macros', async () => {
    // Test the POST route
    const response = await request(app)
      .post('/api/macros/addMacros')
      .send({
        userId: 1,
        protein: 100,
        carbs: 200,
        fats: 50,
        calories: 500
      });

    expect(response.status).to.equal(201);
    expect(response.body.message).to.equal('Macros added successfully!');
  });

  it('should get macros by user ID', async () => {
    // Test the GET route
    const response = await request(app)
      .get('/api/macros/getMacros')
      .query({ userId: 1 });

    expect(response.status).to.equal(200);
    expect(response.body).to.be.an('array');
    // Check the first record
    expect(response.body[0]).to.have.any.keys('protein', 'carbs', 'fats', 'calories');
  });
});
