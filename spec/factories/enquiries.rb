FactoryGirl.define do
  factory :enquiry do
    country Faker::Address.unique.country
    city Faker::Address.unique.city
    results "{}"
    last_update_at Time.now
  end
end
