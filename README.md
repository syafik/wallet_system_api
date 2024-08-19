## Table of Contents
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Running the Application](#running-the-application)
- [Testing](#testing)
- [Contributing](#contributing)
- [License](#license)

Prerequisites
Before you begin, ensure you have the following installed:

Ruby 3.0.0 or later
Rails 6.1.0 or later
PostgreSQL (or your preferred database)
Node.js (for JavaScript runtime)
Yarn (for managing JavaScript packages)
Git (for version control)
Installation
To get the Wallet System API up and running on your local machine, follow these steps:

Clone the Repository

bash
Copy code
git clone https://github.com/syafik/wallet_system_api.git
cd wallet_system_api
Install Ruby Dependencies

Install the required gems using Bundler:

bash
Copy code
bundle install
Install JavaScript Dependencies

Use Yarn to install the necessary JavaScript packages:

bash
Copy code
yarn install
Setup the Database

Create and migrate the database:

bash
Copy code
rails db:create
rails db:migrate
rails db:seed
Set Up Environment Variables

Create a .env file for environment-specific settings. You can copy the example file provided:

bash
Copy code
cp .env.example .env
Edit the .env file with your environment-specific settings (such as database credentials and API keys).

Configuration
Database Configuration
Ensure your config/database.yml is correctly configured for your environment. If you are using PostgreSQL, your configuration might look like this:

yaml
Copy code
default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: <%= ENV['DB_USERNAME'] %>
  password: <%= ENV['DB_PASSWORD'] %>
  host: localhost

development:
  <<: *default
  database: wallet_system_api_development

test:
  <<: *default
  database: wallet_system_api_test

production:
  <<: *default
  database: wallet_system_api_production
  username: wallet_system_api
  password: <%= ENV['WALLET_SYSTEM_API_DATABASE_PASSWORD'] %>
Environment Variables
Add your API keys and other secrets in the .env file:

env
Copy code
DATABASE_USERNAME=your_db_username
DATABASE_PASSWORD=your_db_password
SECRET_KEY_BASE=your_secret_key_base
Running the Application
To start the application, follow these steps:

Start the Rails Server

Run the following command to start the Rails server:

bash
Copy code
rails server
By default, the application will be accessible at http://localhost:3000.

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
Error Handling
All endpoints return appropriate HTTP status codes. In case of errors, the response will include a message describing the error.


