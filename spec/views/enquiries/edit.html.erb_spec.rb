require 'rails_helper'

RSpec.describe "enquiries/edit", type: :view do
  before(:each) do
    @enquiry = assign(:enquiry, Enquiry.create!(
      :country => "MyString",
      :city => "MyString",
      :results => ""
    ))
  end

  it "renders the edit enquiry form" do
    render

    assert_select "form[action=?][method=?]", enquiry_path(@enquiry), "post" do

      assert_select "input[name=?]", "enquiry[country]"

      assert_select "input[name=?]", "enquiry[city]"

      assert_select "input[name=?]", "enquiry[results]"
    end
  end
end
