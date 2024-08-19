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

API Documentation : https://documenter.getpostman.com/view/833810/2sA3s9EUWC



