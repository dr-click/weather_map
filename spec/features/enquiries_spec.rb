require 'rails_helper'

feature 'Enquiry, ' do
  it "User can open new enquiry" do
    enquiry =  FactoryGirl.create(:enquiry)
    visit new_enquiry_path
    expect(page).to have_content "Enter country name"
    expect(page).to have_content "Enter city name"
  end

  it "User can create new enquiry and see results" do
    visit new_enquiry_path
    fill_in "enquiry_country",  :with => "Egypt"
    fill_in "enquiry_city",  :with => "Alexandira"
    click_button 'Search'
    expect(page).to have_content "Enquiry was successfully created"
    expect(page).to have_content "Alexandira"
    expect(page).to have_content "Search Again"
  end

  it "User can see exists enquiry and see cached results" do
    visit new_enquiry_path
    fill_in "enquiry_country",  :with => "Egypt"
    fill_in "enquiry_city",  :with => "Alexandira"
    click_button 'Search'
    expect(page).to have_content "Enquiry was successfully created"
    expect(page).to have_content "Alexandira"
    expect(page).to have_content "Search Again"
    enquiry =  Enquiry.last
    visit new_enquiry_path
    fill_in "enquiry_country",  :with => enquiry.country
    fill_in "enquiry_city",  :with => enquiry.city
    click_button 'Search'
    expect(page).to have_content "Enquiry was successfully created"
    expect(page).to have_content "Alexandira"
    expect(page).to have_content "Search Again"
  end

  it "User cann't create new enquiry with empty data" do
    visit new_enquiry_path
    fill_in "enquiry_country",  :with => ""
    fill_in "enquiry_city",  :with => ""
    click_button 'Search'
    expect(page).to have_content "Country can't be blank"
    expect(page).to have_content "City can't be blank"
  end

  it "User cann't create new enquiry with invalid data and see no results" do
    visit new_enquiry_path
    fill_in "enquiry_country",  :with => "ABC"
    fill_in "enquiry_city",  :with => "XEXEXE"
    click_button 'Search'
    expect(page).to have_content "Enquiry Not Found"
    expect(page).to have_content "Search Again"
  end
end
