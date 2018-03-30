require 'rails_helper'

	feature "farmie registers for site" do

	  scenario "Farmie registers" do
	    visit root_path
	    expect(page).to have_text("Welcome to Farm Stay!")
	    click_link "Join Farm Stay!"
	    fill_in_registration_fields
	    expect(page).to have_content("Welcome! You have signed up successfully.")
	  end

	  def fill_in_registration_fields
	    fill_in "farmie[first_name]", with: Faker::Name.first_name 
	    fill_in "farmie[last_name]", with: Faker::Name.last_name 
	    fill_in "farmie[email]", with: Faker::Internet.email
	    fill_in "farmie[password]", with: 'passweird1234'
	    fill_in "farmie[password_confirmation]", with: 'passweird1234'
	    click_button "Sign up"
	  end
	end