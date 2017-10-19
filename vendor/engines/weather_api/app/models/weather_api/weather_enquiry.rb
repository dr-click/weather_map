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

    def coord
      @results.any? ? @results["coord"] : {}
    end

    def weather
      @results.any? ? @results["weather"].first : {}
    end

    def main
      @results.any? ? @results["main"] : {}
    end

    def wind
      @results.any? ? @results["wind"] : {}
    end

    def visibility
      @results.any? ? @results["visibility"].to_i / 1000 : 0
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
