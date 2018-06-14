require 'rails_helper'

	feature "farmie registers for site" do

	  scenario "Farmie registers", js: true do
	    visit root_path
	    expect(page).to have_text("Welcome to farm stay.")
	    click_link "Join Farm Stay!"
	    fill_in_registration_fields
	    expect(page).to have_content("Welcome! You have signed up successfully.")
	  end

	  scenario "Farmie registers with Facebook" do
	  	visit root_path
	  	expect(page).to have_text("Welcome to farm stay.")
	  	click_link "Join Farm Stay!"
	  	click_link "Sign in with Facebook"
	  	connect_with_facebook
	  	expect(page).to have_text("Welcome to farm stay.")
	  	expect(page).to have_link "Sign out"
	  	farmie = Farmie.last
	  	expect(farmie.provider).to eq 'facebook' #check with your mockups in Devise
	  	expect(farmie.uid).to eq '123545'
	  end

	  def fill_in_registration_fields
	    fill_in "farmie[first_name]", with: Faker::Name.first_name 
	    fill_in "farmie[last_name]", with: Faker::Name.last_name 
	    fill_in "farmie[email]", with: Faker::Internet.email
	    fill_in "farmie[password]", with: 'passweird1234'
	    fill_in "farmie[password_confirmation]", with: 'passweird1234'
	    click_button "Sign up"
	  end

	  def connect_with_facebook
			OmniAuth.config.mock_auth[:facebook]
		end

		def connect_with_twitter
			OmniAuth.config.mock_auth[:twitter]
		end
	end