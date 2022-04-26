<div id="top"></div>

# Sweater Weather

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a></li>
    <li><a href="#getting-started">Getting Started</a></li>
    <li>
      <a href="#api-info">API Info</a>
      <ul>
        <li><a href="#exposed">Exposed</a></li>
        <li><a href="#consumed">Consumed</a></li>
      </ul>
    </li>
    <li><a href="#built-with">Built With</a></li>
    <li><a href="Contributors">Contributors</a></li>
  </ol>
</details>

## About The Project

- Have you ever taken a short day trip only to arrive and realize you didn't prepare for the weather? Have you ever checked the weather just to have the conditions be completely different by time you arrived? Sweater Weather is designed as an application to help users better plan road trips. The app includes weather forecasts for the destination city at your estimated arrival time along with Yelp restaurant suggestions at the destination city. 
- Sweater Weather is the final project for third moduel of Turing's Back-End Engineer program. It's designed to mimic a service-oriented architecture. My job was to expose an API that satisfies the requirements of my front-end users. 
- [Turing Project Page](https://backend.turing.edu/module3/projects/sweater_weather/)
<p align="right">(<a href="#top">back to top</a>)</p>

## Getting Started

1. Fork and Clone the repo: [GitHub - stevenjames-turing/sweater_weather](https://github.com/stevenjames-turing/sweater_weather)
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:{create,migrate}`
4. Get OpenWeather API key [here](https://openweathermap.org/)
5. Get MapQuest Geocoding API key [here](https://developer.mapquest.com/documentation/geocoding-api/)
6. Get Unsplash API key [here](https://unsplash.com/developers)
7. Get Yelp API key [here](https://www.yelp.com/developers/documentation/v3)
8. Setup Figaro: `bundle exec figaro install`
9. Add API keys to `config/application.yml`
 - 
    ```
    openweather_key: <put_your_key_here>
    mapquest_key: <put_your_key_here>
    unsplash_key: <put_your_key_here>
    yelp_key: <put_your_key_here>
    ```
<p align="right">(<a href="#top">back to top</a>)</p>

## API Info:
  ### Exposed:
  
- **Roadtrip**: 
  - `POST /api/v1/road_trip`
  - Response includes: 
    - <img width="960" alt="Screen Shot 2022-04-26 at 4 06 49 PM" src="https://user-images.githubusercontent.com/91357724/165392457-bc131f42-2099-470a-9480-cd47dbac4018.png">
  - Example Request
     ```
      POST /api/v1/road_trip
      Content-Type: application/json
      Accept: application/json
      Request Body: 
         {
            "origin": "Denver,CO",
            "destination": "Fort Collins,CO",
            "api_key": "6d76a22a274ae6ea30c7b60a11a2c15c"
          }
     ```
  - Example Response
    ```
      {
        "data": {
            "id": "null",
            "type": "roadtrip",
            "attributes": {
                "start_city": "Denver,CO",
                "end_city": "Fort Collins,CO",
                "travel_time": "01:03:57",
                "weather_at_eta": {
                    "temperature": 71.8,
                    "conditions": "clear sky"
                }
            }
        }
      }
    ```
    
- **Weather Forecast**: 
  - `GET api/v1/forecast?location=<input_location_here>`
  - Response includes: 
    - <img width="809" alt="Screen Shot 2022-04-26 at 3 23 54 PM" src="https://user-images.githubusercontent.com/91357724/165385907-c9965b6b-0920-467d-a477-6987808eb9a3.png">

  - Example Response
    ```
      GET api/v1/forecast?location=denver,co
      
      {
      "data": {
          "id": "null",
          "type": "forecast",
          "attributes": {
              "current_weather": {
                  "datetime": "2022-04-26T14:12:38.000-05:00",
                  "sunrise": "2022-04-26T07:06:38.000-05:00",
                  "sunset": "2022-04-26T20:48:30.000-05:00",
                  "temperature": 70.41,
                  "feels_like": 67.77,
                  "humidity": 13,
                  "uvi": 8.82,
                  "visibility": 10000,
                  "conditions": "overcast clouds",
                  "icon": "04d"
              },
              "daily_weather": [
                  [
                      {
                          "date": "2022-04-26",
                          "sunrise": "2022-04-26T07:06:38.000-05:00",
                          "sunset": "2022-04-26T20:48:30.000-05:00",
                          "max_temp": 72.27,
                          "min_temp": 43.52,
                          "conditions": "overcast clouds",
                          "icon": "04d"
                      },
                      {
                          "date": "2022-04-27",
                          "sunrise": "2022-04-27T07:05:20.000-05:00",
                          "sunset": "2022-04-27T20:49:30.000-05:00",
                          "max_temp": 73.35,
                          "min_temp": 53.29,
                          "conditions": "light rain",
                          "icon": "10d"
                      },
                      {
                          "date": "2022-04-28",
                          "sunrise": "2022-04-28T07:04:02.000-05:00",
                          "sunset": "2022-04-28T20:50:31.000-05:00",
                          "max_temp": 75.58,
                          "min_temp": 52.59,
                          "conditions": "overcast clouds",
                          "icon": "04d"
                      },
                      {
                          "date": "2022-04-29",
                          "sunrise": "2022-04-29T07:02:46.000-05:00",
                          "sunset": "2022-04-29T20:51:32.000-05:00",
                          "max_temp": 61.54,
                          "min_temp": 51.82,
                          "conditions": "scattered clouds",
                          "icon": "03d"
                      },
                      {
                          "date": "2022-04-30",
                          "sunrise": "2022-04-30T07:01:31.000-05:00",
                          "sunset": "2022-04-30T20:52:33.000-05:00",
                          "max_temp": 66.78,
                          "min_temp": 47.16,
                          "conditions": "clear sky",
                          "icon": "01d"
                      }
                  ]
              ],
              "hourly_weather": [
                  [
                      {
                          "time": "14:00:00",
                          "temperature": 70.41,
                          "conditions": "overcast clouds",
                          "icon": "04d"
                      },
                      {
                          "time": "15:00:00",
                          "temperature": 70.84,
                          "conditions": "overcast clouds",
                          "icon": "04d"
                      },
                      {
                          "time": "16:00:00",
                          "temperature": 71.24,
                          "conditions": "overcast clouds",
                          "icon": "04d"
                      },
                      {
                          "time": "17:00:00",
                          "temperature": 71.49,
                          "conditions": "overcast clouds",
                          "icon": "04d"
                      },
                      {
                          "time": "18:00:00",
                          "temperature": 71.46,
                          "conditions": "overcast clouds",
                          "icon": "04d"
                      },
                      {
                          "time": "19:00:00",
                          "temperature": 72.27,
                          "conditions": "overcast clouds",
                          "icon": "04d"
                      },
                      {
                          "time": "20:00:00",
                          "temperature": 70.29,
                          "conditions": "overcast clouds",
                          "icon": "04d"
                      },
                      {
                          "time": "21:00:00",
                          "temperature": 67.3,
                          "conditions": "overcast clouds",
                          "icon": "04n"
                      }
                  ]
              ]
          }
        }
      }
  
    ```

- **Munchies**: 
  - `GET api/v1/munchies?start=<starting_city>&destination=<destination_city>,co&food=<food_style_or_restaurant_type>`
  - Example Response
    ```
      GET api/v1/munchies?start=denver,co&destination=fort collins,co&food=tacos
      {
        "data": {
            "id": "null",
            "type": "munchies",
            "attributes": {
                "destination_city": "fort collins,co",
                "travel_time": "01:03:57",
                "forecast": {
                    "summary": "clear sky",
                    "temperature": 71.8
                },
                "restaurant": {
                    "name": "Uno Mas Taqueria",
                    "address": "120 W Olive Fort Collins, CO 80524"
                }
            }
        }
      }
    ```

- **Background Image for City**: 
  - `GET /api/v1/backgrounds?location=<input_location_here>`
  - Example Response
    ```
      GET /api/v1/backgrounds?location=denver,co
      
      {
        "data": {
            "id": "null",
            "type": "photo",
            "attributes": {
                "source": "unsplash.com",
                "image_url": "https://images.unsplash.com/photo-1511286148006-ec48824e3282?crop=entropy&cs=srgb&fm=jpg&ixid=MnwzMjIzODZ8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjbyUyMGJyb2tlbiUyMGNsb3Vkc3xlbnwwfHx8fDE2NTEwMDI0ODU&ixlib=rb-1.2.1&q=85",
                "photographer": "Miranda Joondeph",
                "photographer_profile": "https://unsplash.com/@mirandafayj?utm_source=Sweater_Weather&utm_medium=referral"
            }
          }
      }
  
    ```
    
- **User Registration**: 
  - `POST /api/v1/users`
  - Returns a 201 if User successfully created. Will return a 400 if password does not match confirmation or if user email has been taken
  - Example Request
     ```
      POST /api/v1/users
      Content-Type: application/json
      Accept: application/json
      Request Body: 
         {
          "email": "HireStevenJames@gmail.com",
          "password": "Email_Me_For_My_Resume",
          "password_confirmation": "Email_Me_For_My_Resume"
         }
     ```

  - Example Successful Response
    ```      
      {
        "data": {
            "id": "12",
            "type": "user",
            "attributes": {
                "email": "HireStevenJames@gmail.com",
                "api_key": "6d76a22a274ae6ea30c7b60a11a2c15c"
            }
        }
      }
  
    ```
  - Example Errors
    ```      
      {
        "error": {
            "message": "email has already been taken"
        }
      }
      {
        "error": {
            "message": "passwords do not match"
        }
      }
      {
        "error": {
            "message": "missing request body"
        }
      }
      
    ```
    
- **User Log-In Session**: 
  - `POST /api/v1/sessions`
  - Returns a 200 if User successfully logs in. Will return a 401 if invalid credentials
  - Example Request
     ```
      POST /api/v1/sessions
      Content-Type: application/json
      Accept: application/json
      Request Body: 
         {
          "email": "HireStevenJames@gmail.com",
          "password": "Email_Me_For_My_Resume"
         }
     ```

  - Example Successful Response
    ```      
      {
        "data": {
            "id": "12",
            "type": "user",
            "attributes": {
                "email": "HireStevenJames@gmail.com",
                "api_key": "6d76a22a274ae6ea30c7b60a11a2c15c"
            }
        }
      }
  
    ```
  - Example Errors
    ```      
      {
        "error": {
            "message": "invalid credentials"
        }
      }
      {
        "error": {
            "message": "missing request body"
        }
      }
    ```
    

  ### Consumed:
    - OpenWeather
      - [One Call API 1.0](https://openweathermap.org/api/one-call-api)
        - `https://api.openweathermap.org/data/2.5/onecall?lat={lat}&lon={lon}&exclude={part}&appid={API key}`
        - Used for weather forecast data. We are utilizing Current, Hourly, and Daily data.
    - MapQuest
      - [Directions API - Route](https://developer.mapquest.com/documentation/directions-api/route/get)
        - `http://www.mapquestapi.com/directions/v2/route?key=KEY&from=Clarendon Blvd,Arlington,VA&to=2400+S+Glebe+Rd,+Arlington,+VA`
        - Used for getting drive time to determine ETA for destination
      - [Geocoding API - Address](https://developer.mapquest.com/documentation/geocoding-api/address/get)
        - `http://www.mapquestapi.com/geocoding/v1/address?key=KEY&location=Washington,DC`
        - Used for retrieving latitude and longitude coordinates for destination, which is then passed into the OpenWeather API
    - Unsplash
      - [Search Photos](https://unsplash.com/documentation#search-photos)
        - `https://api.unsplash.com/search/photos?page=1&query=cloudy`
        - Used to retrieve a photo to display on landing page. We are using the destination and weather conditions as a search query to return photos relevant to our users experience.
    - Yelp Fusion 
      - [Business Search](https://www.yelp.com/developers/documentation/v3/business_search)
        - `https://api.yelp.com/v3/businesses/search?term=tacos&location=denver,co`
        - Used to search for restaurants at destination city that will be open at time of arrival that matches food/restaurant type selected in request

<p align="right">(<a href="#top">back to top</a>)</p>

## Built With:

- Framework: Ruby on Rails
  - Versions
    - Ruby: 2.7.4
    - Rails: 5.2.6
- Database: PostgreSQL
- Other tech used: 
  - Postman
  - RSpec 
<p align="right">(<a href="#top">back to top</a>)</p>

## Contributors

- [Steven James](https://github.com/stevenjames-turing)
<p align="right">(<a href="#top">back to top</a>)</p>
