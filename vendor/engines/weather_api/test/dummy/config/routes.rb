Rails.application.routes.draw do
  mount WeatherApi::Engine => "/weather_api"
end
