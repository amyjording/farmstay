require 'rails_helper'

feature "signing in" do
	let(:farmie) {FactoryBot.create(:farmie)}
	let(:other_farmie) {FactoryBot.create(:other_farmie)}

	def fill_in_signin_fields
		fill_in "farmie[email]", with: farmie.email
		fill_in "farmie[password]", with: farmie.password
		click_button "Log in"
	end

	def fill_in_bad_password
		fill_in "farmie[email]", with: farmie.email
		fill_in "farmie[password]", with: 'badpass'
		click_button "Log in"
	end

	def connect_with_facebook
		OmniAuth.config.mock_auth[:facebook]
	end

#	def connect_with_twitter
#		OmniAuth.config.mock_auth[:twitter]
#	end

	scenario "visiting the site to sign in" do
		visit root_path
		click_link "Sign in"

		fill_in_signin_fields
		expect(page).to have_content("Signed in successfully.")
	end


	scenario "visiting the site to sign in with facebook" do
		visit root_path
		click_link "Sign in"
		click_link "Sign in with Facebook"
		
		connect_with_facebook
		expect(page).to have_content("Successfully authenticated from Facebook account.")
	end

#	scenario "visiting the site to sign in with twitter" do
#		visit root_path
#		click_link "Sign in"
#		click_link "Sign in with Twitter"
		
#		connect_with_twitter
#		expect(page).to have_content("Signed in successfully.")
#	end

	context 'sees failure message' do
	  scenario "when entering wrong password" do
	  	visit root_path
	  	click_link "Sign in"

	  	fill_in_bad_password
	  	expect(page).to have_content("Invalid Email or password.")
	  end
	 end

end