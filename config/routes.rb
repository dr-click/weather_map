Rails.application.routes.draw do
  resources :enquiries, only: [:new, :show, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # mount weather_api if it has routes
  # mount WeatherApi::Engine => "/weather_api"
  
  root :to => "enquiries#new"
end
