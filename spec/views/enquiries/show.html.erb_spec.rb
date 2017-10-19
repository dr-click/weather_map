require 'rails_helper'

RSpec.describe "enquiries/show", type: :view do
  before(:each) do
    @enquiry = assign(:enquiry, Enquiry.create!(
      :country => "Country",
      :city => "City",
      :results => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(//)
  end
end
