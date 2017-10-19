require 'rails_helper'

RSpec.describe "enquiries/index", type: :view do
  before(:each) do
    assign(:enquiries, [
      Enquiry.create!(
        :country => "Country",
        :city => "City",
        :results => ""
      ),
      Enquiry.create!(
        :country => "Country",
        :city => "City",
        :results => ""
      )
    ])
  end

  it "renders a list of enquiries" do
    render
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
