const request = require('supertest');
const app = require('./server');

const assert = require('assert');

describe('Server Start Test', function() {
  it('should start the server', function(done) {
    request(app)
      .get('/')
      .expect(200, done);
  });
});