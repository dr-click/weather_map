require 'rails_helper'

RSpec.describe "Enquiries", type: :request do
  describe "GET /enquiries/new" do
    it "works! (now write some real specs)" do
      get new_enquiry_path
      expect(response).to have_http_status(200)
    end
  end
end
