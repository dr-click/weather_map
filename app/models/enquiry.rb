class Enquiry < ApplicationRecord
  # TODO: Change country and city to be association instead of string
  validates :country, :city, :results, :last_update_at, presence: true
  validates :country, uniqueness: { scope: :city }

  before_validation :set_last_update_at



  #######
  private
  #######

  def set_last_update_at
    last_update_at = Time.now
  end
end
