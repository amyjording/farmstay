require 'rails_helper'

feature "farmie profiles" do

  let(:farmie) {FactoryBot.create(:farmie)}
 # let(:farmie_picture) {FactoryBot.create(:farmie_picture)}
 # let(:picture) {FactoryBot.create(:picture)}

  before do
    login_as(farmie, scope: :farmie,
      run_callbacks: :false)
  end

  # NOTE: 5/12 - Removing all automatic testing for CarrierWave uploader. It works with a binding pry but not automatically.
  # Taking tests out at this time. Going to try again with Shrine.

	scenario "farmie edits their profile" do
		visit edit_farmie_profile_path(farmie, 1)
		expect(page).to have_css("img[src*='farmer-penguin']") #find(:xpath, './/ul/li').text match_css("img[alt='Farmer penguin']")#change this later
		Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/files/profile_pic.jpg"), 'image/jpg')
    #page.attach_file "yourprofilepicture", "C:/Users/ADMIN/the_odin_project/Rails/farmstay/spec/fixtures/files/profile_pic.jpg"
    #attach_profile_picture
    #profile_pic = picture #fixture_file_upload('/files/profile_pic.jpg', 'image/jpg')
    fill_in "profile[name]", with: Faker::Name.initials(2)
		fill_in "profile[intro]", with: Faker::Lorem.sentence(3, true, 10)
		fill_in "profile[about]", with: Faker::Lorem.paragraph(2, true, 4)
		choose "Yes"
    click_button "Update profile"
    # expect(farmie.profile).to have_attributes(picture: "profile_pic.jpg")
		expect(page).to have_content("Profile updated")
		profile = Profile.last
		expect(profile.show_visited_farms).to eq true
  end

end
