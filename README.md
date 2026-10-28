# gitactions-prac 
# This is a practice repository for learning GitHub Actions. It contains workflows that demonstrate how to automate tasks such as building, testing, and deploying code using GitHub Actions.
# Node.js CI/CD Practice Project

A beginner DevOps project demonstrating automated testing, code quality checks, and dependency security scanning using GitHub Actions.

## Overview

This project is a small REST API built with Node.js and Express. It is used to practice continuous integration and prepare for a containerized deployment pipeline.

## Technology Stack

- Node.js
- Express
- Jest
- Supertest
- ESLint
- GitHub Actions
- npm

## API Endpoints

| Method | Endpoint | Description |
|---|---|---|
| GET | `/` | Returns a welcome message |
| GET | `/health` | Returns the application health status |
| GET | `/api/users` | Returns a sample list of users |

## Run Locally

Install dependencies:

```bash
npm ci
```

Start the application:

```bash
npm start
```

Open `http://localhost:3000` or test the health endpoint:

```bash
curl http://localhost:3000/health
```

## Run Quality Checks

Run ESLint:

```bash
npm run lint
```

Run tests:

```bash
npm test
```

Run both checks:

```bash
npm run check
```

## Continuous Integration

The GitHub Actions workflow runs on pushes to `main`, pull requests targeting `main`, and manual workflow dispatches.

It installs dependencies, runs linting and automated tests, generates coverage output, and checks dependencies for known vulnerabilities.

## Roadmap

- [x] Build a Node.js REST API
- [x] Add automated tests
- [x] Configure ESLint
- [ ] Consolidate CI workflows
- [ ] Add Docker support
- [ ] Scan container images with Trivy
- [ ] Publish images to Amazon ECR
- [ ] Provision AWS infrastructure with Terraform
- [ ] Deploy to Amazon ECS Fargate using GitHub Actions and OIDC

## Learning Objectives

- Understand CI/CD pipelines
- Practice Git branches and pull requests
- Automate testing and code quality checks
- Introduce DevSecOps scanning
- Progress toward container deployment and AWS infrastructure automation