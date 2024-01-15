# Whether Sweater? API

## Overview
This Ruby on Rails API project aims to provide functionality for planning road trips, allowing users to check the current weather and forecasted weather at the destination. The application follows a service-oriented architecture, and the front-end communicates with the back-end through an API.

## Learning Goals
- Expose an API that aggregates data from multiple external APIs
- Implement authentication token for API access
- Provide CRUD functionality through the API
- Determine completion criteria based on the needs of other developers
- Test API consumption and exposure using mocking tools (VCR, Webmock, etc.)

## Setup
1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/whether_sweater_api.git

2. bundle install


3. rails db:create
rails db:migrate

Set up your environment variables:

Obtain API keys from [API Providers] for weather data and any other external services.

Create a .env file in the project root and add your API keys:

env: 
  WEATHER_API_KEY=your_weather_api_key
  OTHER_API_KEY=your_other_api_key

API Endpoints
/api/v1/endpoint1: Description of endpoint 1
/api/v1/endpoint2: Description of endpoint 2
...
Happy Path
Provide examples of successful API requests and responses for common scenarios.

Testing
Use RSpec for testing.
Utilize mocking tools such as VCR and Webmock for API testing.
Contributing
If you would like to contribute to this project, please follow our [Contribution Guidelines].

License
This project is licensed under the [MIT License] - see the [LICENSE.md] file for details.

vbnet






