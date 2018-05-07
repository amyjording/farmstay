require 'rails_helper'

feature "farmie profiles" do

  let(:farmie) {FactoryBot.create(:farmie)}
 # let(:farmie_picture) {FactoryBot.create(:farmie_picture)}
 # let(:picture) {FactoryBot.create(:picture)}

  before do
    login_as(farmie, scope: :farmie,
      run_callbacks: :false)
  end

	scenario "farmie edits their profile", js: true do
		visit edit_farmie_profile_path(farmie, 1)
		expect(page).to have_css("img[src*='farmer-penguin']") #find(:xpath, './/ul/li').text match_css("img[alt='Farmer penguin']")#change this later
		#attach_profile_picture
    #profile_pic = picture #fixture_file_upload('/files/profile_pic.jpg', 'image/jpg')
    fill_in "profile[name]", with: Faker::Name.initials(2)
		fill_in "profile[intro]", with: Faker::Lorem.sentence(3, true, 10)
		fill_in "profile[about]", with: Faker::Lorem.paragraph(2, true, 4)
		choose "Yes"
    #farmie_picture # Farmie attaches two farm pictures
    #add_farmie_picture = farmie_picture
    click_button "Update profile"
		expect(page).to have_content("Profile updated")
		profile = Profile.last
		expect(profile.show_visited_farms).to eq true
  end

end
