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

  ```
  git clone https://github.com/bkchilidawg/sweater_weather_api
  ```
   
2. Install dependencies:

```
bundle install
```
3. Set up the database:

```
rails db:create
rails db:migrate
``````
4. Set up your environment variables:

Obtain API keys from https://www.weatherapi.com/ for weather data and https://developer.mapquest.com/user/me/apps for external services.

5. Create a .env file in the project root and add your API keys:

```
weather_api:
    key: your_weather_api_key
mapquest_api:
    key: your_weather_api_key
```


# API Requests and Responses

Example Request:

```
 POST http://localhost:3000/api/v1/road_trip 
-H "Content-Type: application/json" \
-H "Authorization: Bearer YOUR_ACCESS_TOKEN" \
-d '{"origin": "Cincinnati, OH", "destination": "Chicago, IL"}'
```
Description: This endpoint allows users to plan a road trip by providing the origin and destination cities. It returns information such as travel time and weather at the destination.

Example Response:
```
{
  "data": {
    "id": null,
    "type": "road_trip",
    "attributes": {
      "start_city": "Cincinnati, OH",
      "end_city": "Chicago, IL",
      "travel_time": "04:40:45",
      "weather_at_eta": {
        "datetime": "2023-04-07 23:00",
        "max_temp": 44.2,
        "condition": "Cloudy with a chance of meatballs"
      }
    }
  }
}
```

Example Request:

```
 POST http://localhost:3000/api/v0/users
-H "Content-Type: application/json" 

-d '{
  "email": "whatever@example.com",
  "password": "password",
  "password_confirmation": "password"
}
'
```
Description: This endpoint allows users to create a new account

Example Response:
```
{
    "data": {
        "type": "users",
        "id": 971,
        "attributes": {
            "email": "d@example.com",
            "api_key": "24c720a2e0086bd9dd9fdc7eb2fec053708b7d4b"
        }
    }
}
```

Example Request:

```
 POST http://localhost:3000/api/v0/sessions
-H "Content-Type: application/json" 

-d '{
  "email": "whatever@example.com",
  "password": "password",
}
'
```
Description: This endpoint allows users to start a new session using the provided API key

Example Response:
```
{
    "data": {
        "id": "889",
        "type": "user",
        "attributes": {
            "email": "whatever@example.com",
            "api_key": "a6cfad8218d028b9062ff06458655b3dc0a28b41"
        }
    }
}
```

Example Request:

```
 GET http://localhost:3000/api/v0/forecast?location=cincinatti,oh
-H "Content-Type: application/json" 
```
Description: This endpoint allows users to get the forecast 

Example Response:
```
{
  "data": {
    "id": null,
    "type": "forecast",
    "attributes": {
      "current_weather": {
        "last_updated": "2024-01-17 03:00",
        "temperature": 10.0,
        "feels_like": -2.7,
        "humidity": 60,
        "uvi": 1.0,
        "visibility": 9.0,
        "condition": "Clear",
        "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png"
      },
      "daily_weather": [
        {
          "date": "2024-01-17",
          "sunrise": "07:55 AM",
          "sunset": "05:41 PM",
          "max_temp": 27.5,
          "min_temp": 9.5,
          "condition": "Sunny",
          "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png"
        },
        // ... (additional daily weather entries)
      ],
      "hourly_weather": [
        {
          "time": "00:00",
          "temperature": 11.2,
          "conditions": "Clear",
          "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png"
        },
        // ... (additional hourly weather entries)
      ]
    }
  }
}

```

# Testing
Use RSpec for testing.
Utilize mocking tools such as VCR for API testing.
# Contributing

Blaine Kennedy 

[![LinkedIn][linkedin-shield]][linkedin-url-bk] 
[![GitHub][github-shield-bk]][github-url-bk]

[linkedin-url-bk]: https://www.linkedin.com/in/blaine-kennedy
[github-shield-bk]: https://img.shields.io/badge/GitHub-bkchilidawg-success?style=for-the-badge&logo=github
[github-url-bk]: https://github.com/bkchilidawg
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555