const request = require("supertest");
const app = require("../src/server");

describe("API tests", () => {
  test("GET / should return hello message", async () => {
    const response = await request(app).get("/");

    expect(response.statusCode).toBe(200);
    expect(response.body.message).toBe("Hello from Node.js!");
  });

  test("GET /health should return UP", async () => {
    const response = await request(app).get("/health");

    expect(response.statusCode).toBe(200);
    expect(response.body.status).toBe("UP");
  });
});
