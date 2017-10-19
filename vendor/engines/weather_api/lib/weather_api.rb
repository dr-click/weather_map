require "weather_api/engine"
require 'open_weather'

module WeatherApi
  # My own wrapper for the weather api requests
  class CurrentWeather
    # initialize with mandatory parameter api_key
    def initialize(api_key, *opts)
      @options = {APPID: api_key}
      opts.each do |op|
        op.each { |k,v| @options = @options.merge({k => v}) } if op.is_a? Hash
      end

      @options = @options.merge({:units => "metric"}) #metric, #imperial
    end

    def fetch_by_country_and_city(country, city)
      raise ArgumentError, 'Argument is not valid country or city' if country.blank? || city.blank?
      @country = country
      @city = city
      fetch
    end

    #######
    private
    #######

    # fetch call using OpenWeather gem by calling OpenWeather::Current.city
    def fetch
      parse_results(OpenWeather::Current.city("#{@city}, #{@country}", @options))
    end

    # parse the results come from WeatherMAPApi and check the status
    def parse_results(results)
      if results && results["cod"] == 200
        WeatherApi::WeatherEnquiry.new(results)
      else
        WeatherApi::WeatherEnquiry.new({})
      end
    end
  end
end
