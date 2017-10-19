require 'rails_helper'

RSpec.describe EnquiriesController, type: :controller do

  let(:valid_attributes) {
    FactoryGirl.build(:enquiry).attributes
  }

  let(:invalid_attributes) {
    FactoryGirl.build(:enquiry, city: nil).attributes
  }

  let(:valid_session) { {} }

  describe "GET #show" do
    it "returns a success response" do
      enquiry = Enquiry.create! valid_attributes
      get :show, params: {id: enquiry.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Enquiry" do
        expect {
          post :create, params: {enquiry: valid_attributes}, session: valid_session
        }.to change(Enquiry, :count).by(1)
      end

      it "redirects to the created enquiry" do
        post :create, params: {enquiry: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Enquiry.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {enquiry: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end
end
