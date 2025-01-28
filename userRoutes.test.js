const request = require('supertest');
const app = require('./server');
const { addUser } = require('./db/addUser');
const { truncateUsers } = require('./db/user');
const { expect } = require('chai');
const { connectDB } = require('./db/db');

describe('User Routes', () => {
  it('should add a new user', async () => {
    await truncateUsers(); // Clear the users table
    const response = await request(app)
      .post('/api/users/addUser')
      .send({ username: 'testuser1', email: 'test1@example.com', password: 'password' });

    expect(response.status).to.equal(201);
    expect(response.body.message).to.equal('User added successfully!');
  });

  it('should verify a user', async () => {
    await truncateUsers(); // Clear the users table
    await addUser('testuser', 'test@example.com', 'password'); // Add a user to verify

    const response = await request(app)
      .post('/api/users/verifyUser')
      .send({ username: 'testuser', password: 'password' });

    expect(response.status).to.equal(201);
    expect(response.body.message).to.equal('User verified successfully!');
  });

  it('should return an error for invalid credentials', async () => {
    await truncateUsers(); // Clear the users table
    await addUser('testuser', 'test@example.com', 'password'); // Add a user to verify

    const response = await request(app)
      .post('/api/users/verifyUser')
      .send({ username: 'testuser', password: 'wrongpassword' });

    expect(response.status).to.equal(401);
    expect(response.body.error).to.equal('Invalid username or password.');
  });

  it('should return an error for a user not found', async () => {
    await truncateUsers(); // Clear the users table

    const response = await request(app)
      .post('/api/users/verifyUser')
      .send({ username: 'nonexistentuser', password: 'password' });

    expect(response.status).to.equal(404);
    expect(response.body.error).to.equal('User not found!');
  });
});
