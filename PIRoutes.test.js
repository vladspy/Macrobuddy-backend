// PIRoutes.test.js

const request = require('supertest');
const app = require('./server'); // or wherever your Express app is defined
const { addUser } = require('./db/addUser');
const { truncateUsers } = require('./db/user'); // assuming these exist
const { expect } = require('chai');
const { connectDB } = require('./db/db');

describe('Personal Info Routes', () => {
  let testUserId;

  beforeEach(async function() {
    this.timeout(15000);

    // Clear the users table (optional, if you want a fresh start each time)
    await truncateUsers();

    // Add or fetch "testuser"
    const connection = await connectDB();
    const [rows] = await connection.execute('SELECT * FROM user WHERE username = ?', ['testuser']);

    if (rows.length === 0) {
      await addUser('testuser', 'test@example.com', 'password');
      const [newRows] = await connection.execute('SELECT * FROM user WHERE username = ?', ['testuser']);
      testUserId = newRows[0].user_id;
    } else {
      testUserId = rows[0].user_id;
    }

    connection.release();
  });

  afterEach(async function() {
    // Clear (truncate) again if you want no leftover data
    await truncateUsers();
  });

  it('should add personal info', async function() {
    const response = await request(app)
      .post('/api/personal-info/addPI')
      .send({
        userId: testUserId,
        sex: 1,
        height: 180,
        age: 30,
        weight: 70,
        firstName: 'John',
        lastName: 'Doe'
      });

    expect(response.status).to.equal(201);
    expect(response.body.message).to.equal('Personal information saved successfully!');
  });

  it('should get personal info by user ID', async function() {
    this.timeout(20000);

    // First, POST some personal info
    const postRes = await request(app)
      .post('/api/personal-info/addPI')
      .send({
        userId: testUserId,
        sex: 1,
        height: 180,
        age: 30,
        weight: 70,
        firstName: 'John',
        lastName: 'Doe'
      });

    expect(postRes.status).to.equal(201);

    // Then, GET that personal info
    const getRes = await request(app)
      .get('/api/personal-info/getPI')
      .query({ userId: testUserId });

    expect(getRes.status).to.equal(200);
    expect(getRes.body).to.be.an('object');
    expect(getRes.body).to.have.property('user_id', testUserId); // DB column might be user_id
    expect(getRes.body).to.have.property('first_name', 'John');   // DB column might be first_name
    expect(getRes.body).to.have.property('last_name', 'Doe');    // DB column might be last_name
  });
});
