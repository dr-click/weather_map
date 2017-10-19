json.extract! enquiry, :id, :country, :city, :results, :last_update_at, :created_at, :updated_at
json.url enquiry_url(enquiry, format: :json)
