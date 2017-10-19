module WeatherApi
  #My own logic for fetch data from database or API
  class WeatherEnquiry
    # TODO: User can choose between cached resulted of fresh results
    # TODO: Expire valud may be in seconds
    # TODO: The engine should be configured with the table name of storing cached results

    def initialize(res_hash)
      @results = res_hash
    end

    def results
      @results
    end

    # {"coord"=>{"lon"=>29.92, "lat"=>31.2}, "weather"=>[{"id"=>800, "main"=>"Clear", "description"=>"clear sky", "icon"=>"01n"}], "base"=>"stations", "main"=>{"temp"=>293.965, "pressure"=>1031.26, "humidity"=>100, "temp_min"=>293.965, "temp_max"=>293.965, "sea_level"=>1031.74, "grnd_level"=>1031.26}, "wind"=>{"speed"=>3.46, "deg"=>33.0021}, "clouds"=>{"all"=>0}, "dt"=>1508273008, "sys"=>{"message"=>0.0036, "country"=>"EG", "sunrise"=>1508213105, "sunset"=>1508253923}, "id"=>360015, "name"=>"Ash Shāţibī", "cod"=>200}
    
    def coord
      @results.any? ? @results["coord"] : {}
    end

    def weather
      @results.any? ? @results["weather"].first : {}
    end

    def self.data_expires_after
      AppConfig.openweathermap["data_expires_after"]
    end

    def self.find(country, city)
      enquiry = Enquiry.by_country_or_city(country.downcase, city.downcase).first
      return enquiry if enquiry && enquiry.has_data? && !enquiry.expire?
      enquiry ||= Enquiry.new(country: country, city: city)
      weather_enquiry = WeatherApi::CurrentWeather.new(AppConfig.openweathermap["api_key"]).fetch_by_country_and_city(country, city)
      enquiry.results = weather_enquiry.results
      enquiry.save!
      enquiry
    end
  end
end
