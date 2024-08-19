## Table of Contents
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Running the Application](#running-the-application)

## Prerequisites

- Ruby 3.0.0
- Rails 7
- PostgreSQL (or your preferred database)

## Installation

1. **Clone the Repository**

   ```bash
   git clone git@github.com:syafik/wallet_system_api.git
   cd wallet_system_api
   bundle install
   rails db:create
   rails db:migrate
   rails db:seed

## Configuration

Ensure your `config/database.yml` is correctly configured for your environment. You may also need to configure other services or third-party APIs.

For example, if you use an external API, set the API keys in the `.env` file:

```bash
API_KEY=your_api_key


## Running the Application

1. **Start the Rails Server**

   ```bash
   rails server

API Endpoints
Here are the main API endpoints for the Wallet System API:

Authentication
POST /api/v1/login
Authenticate a user and generate a JWT token.
Request Body: { "email": "user@example.com", "password": "password" }
Response: { "token": "your_jwt_token" }
Wallets
GET /api/v1/wallets/

Retrieve the balance and details of a specific wallet.
Requires authentication.
POST /api/v1/wallets

Create a new wallet.
Requires authentication.
Transactions
POST /api/v1/transactions/deposit

Perform a deposit transaction.
Request Body: { "wallet_id": 1, "amount": 100 }
Requires authentication.
POST /api/v1/transactions/withdraw

Perform a withdrawal transaction.
Request Body: { "wallet_id": 1, "amount": 50 }
Requires authentication.
POST /api/v1/transactions/transfer

Perform a transfer transaction between wallets.
Request Body: { "source_wallet_id": 1, "target_wallet_id": 2, "amount": 25 }
Requires authentication.



