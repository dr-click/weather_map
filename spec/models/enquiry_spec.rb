require 'rails_helper'

RSpec.describe Enquiry, type: :model do
  it 'should be valid with country, city, results, last_update_at' do
    enquiry = FactoryGirl.build(:enquiry)
    expect(enquiry).to be_valid
  end

  it 'should not be valid without country' do
    enquiry = FactoryGirl.build(:enquiry, country: nil)
    expect(enquiry).to_not be_valid
  end

  it 'should not be valid without city' do
    enquiry = FactoryGirl.build(:enquiry, city: nil)
    expect(enquiry).to_not be_valid
  end
end
