# WeatherMap

###### Simple weather application to display the current weather in a given location

Project Details:

* Environment

> Ruby 2.4.2
> Rails 5.1.4
> PostgreSQL


* Code dependencies

> Rails engine: Create the required libraries for the API calls and results mapping
> open-weather: A ruby gem wrapper for open weather map


* Test dependencies

> rspec: testing framework for Rails
> faker: A library for generating fake data such as names, addresses, and phone numbers
> factory_girl_rails: fixtures replacement with a straightforward definition syntax
> simplecov: Code coverage for Ruby
> selenium-webdriver: WebDriver is a tool for writing automated tests of websites


* Why open-weather ?

The gem provide an easy methods to the WeatherMapAPI with JSON response format, For saving time i used it.


* WeatherMap is Live

The project was hosted and running on Heroku, follow this link: [WeatherMap](https://weather-map-api.herokuapp.com)


* Test

Using RSpec and some other testing tool to reach the 100% code coverage, to run the test run the following command:
```
rspec
```
Follow this link to check the code coverage results: [Code Coverage](https://weather-map-api.herokuapp.com/coverage/index.html)


* Changes todo later

- User can choose between cached resulted of fresh results.
- User can see results for upcoming x numbers of days.
- Change country and city in Enquiry model to be association instead of string.
- Force the value of each Enquiry field (country and city) to contains city only or country only from a predefined list.
- Expire value may be in seconds.
- Mock the API calls for testing, it's not recommended to use the real API calls while running test codes.
