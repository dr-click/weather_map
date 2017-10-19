require "rails_helper"

RSpec.describe EnquiriesController, type: :routing do
  describe "routing" do
    it "routes to #new" do
      expect(:get => "/enquiries/new").to route_to("enquiries#new")
    end

    it "routes to #show" do
      expect(:get => "/enquiries/1").to route_to("enquiries#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/enquiries").to route_to("enquiries#create")
    end
  end
end
