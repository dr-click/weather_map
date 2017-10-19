class Enquiry < ApplicationRecord
  # TODO: Change country and city to be association instead of string
  validates :country, :city, presence: true
  validates :results, :last_update_at, presence: true, if: Proc.new {|e| !e.country.blank? && !e.city.blank? }
  validates :country, uniqueness: { scope: :city }

  before_validation do
    self.last_update_at = Time.now
    self.country = self.country.downcase unless self.country.blank?
    self.city = self.city.downcase unless self.city.blank?
  end

  # TODO: Force the value of each Enquiry field to contains city only or country only
  scope :by_country_or_city, -> (country, city) {where("(country=? and city=?) or (country=? and city=? )", country, city, city, country)}

  def expire?
    self.last_update_at && self.last_update_at < Time.now - WeatherApi::WeatherEnquiry.data_expires_after.minutes
  end

  def has_data?
    self.results.any?
  end

  def weather_enquiry
    WeatherApi::WeatherEnquiry.new(self.results)
  end
  
  #######
  private
  #######


end
