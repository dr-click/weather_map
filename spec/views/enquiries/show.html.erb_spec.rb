require 'rails_helper'

RSpec.describe "enquiries/show", type: :view do
  before(:each) do
    @enquiry = assign(:enquiry, FactoryGirl.create(:enquiry))
  end

  it "renders attributes in <div>" do
    render
    expect(rendered).to match(/Search/)
  end
end
