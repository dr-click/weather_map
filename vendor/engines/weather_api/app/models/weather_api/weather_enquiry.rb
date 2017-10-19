module WeatherApi
  #My own logic for fetch data from database or API

  class WeatherEnquiry
    # TODO: User can choose between cached resulted of fresh results
    # TODO: Expire value may be in seconds
    # TODO: The engine should be configured with the table name of storing cached results

    def initialize(res_hash)
      @results = res_hash
    end

    # results hash
    def results
      @results
    end

    # weather attibutes from results hash
    def weather
      @results.any? ? @results["weather"].first : {}
    end

    # main attibutes from results hash
    def main
      @results.any? ? @results["main"] : {}
    end

    # wind attibutes from results hash
    def wind
      @results.any? ? @results["wind"] : {}
    end

    # visibility attibutes from results hash
    def visibility
      @results.any? ? @results["visibility"].to_i / 1000 : 0
    end

    def self.data_expires_after
      AppConfig.openweathermap["data_expires_after"] || 10
    end

    # Find or create Enquiry record based on country and city and search first for cached not expired version
    # WeatherApi::CurrentWeather model is located in vender/engines/weather_api/lib
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
