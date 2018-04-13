require 'rails_helper'


feature "farmie profiles" do

	let(:farmie) {FactoryBot.create(:farmie)}

	before do
		login_as(farmie, scope: :farmie,
			run_callbacks: :false)
	end

	scenario "farmie edits their profile" do
		visit edit_farmie_profile_path(farmie, 1)
		fill_in "profile[name]", with: Faker::Name.initials(2)
		fill_in "profile[intro]", with: Faker::Lorem.sentence(3, true, 10)
		fill_in "profile[about]", with: Faker::Lorem.paragraph(2, true, 4)
		choose "Yes"
		click_button "Update profile"
		expect(page).to have_content("Profile updated")

		profile = Profile.last
		expect(profile.show_visited_farms).to eq(true)
	end

end