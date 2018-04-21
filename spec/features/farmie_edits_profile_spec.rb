require 'rails_helper'

feature "farmie profiles" do

  let(:farmie) {FactoryBot.create(:farmie)}

  before do
    login_as(farmie, scope: :farmie,
      run_callbacks: :false)
  end

  after do
    PictureUploader.enable_processing = false
    uploader.remove!
  end

	scenario "farmie edits their profile", js: true do
		visit edit_farmie_profile_path(farmie, 1)
		expect(page).to have_css("img[src*='farmer-penguin']") #find(:xpath, './/ul/li').text match_css("img[alt='Farmer penguin']")#change this later
		fill_in "profile[name]", with: Faker::Name.initials(2)
		fill_in "profile[intro]", with: Faker::Lorem.sentence(3, true, 10)
		fill_in "profile[about]", with: Faker::Lorem.paragraph(2, true, 4)
		choose "Yes"
    click_button "Update profile"
		expect(page).to have_content("Profile updated")
		profile = Profile.last
		expect(profile.show_visited_farms).to eq(true)
  end

=begin

  When I run this in test mode with Selenium Webdriver, and upload a picture, it actually works just fine.
  I simply can't figure out how to get the file to save into the database properly. I think it's a matter
  of the 'user' not actually clicking the "Browse" button. Or there's another piece missing. 

  Either way, when I actually physically try it in Selenium with a binding pry to halt the process, I can
  confirm that it does work. So for the time being, all of my tests regarding CarrierWave are commented out.

  I'll save the perfection for later.

  Musings for future attempts: Consider testing this in the Controller. 

  let(:uploader) { PictureUploader.new(farmie, :picture) }

  #after do
  #  PictureUploader.enable_processing = false
  #  uploader.remove!
  #end

    #farmie_picture = fixture_file_upload('spec/fixtures/files/profile_pic.jpg', 'image/jpg')
    #post edit_farmie_profile_path, micropost: { content: content, picture: FILL_IN }
    #upload_profile_picture#profile_pic_path = 'spec/fixtures/files/profile_pic.jpg'
  
  scenario "farmie adds a photo to their profile", type: :request do

    visit edit_farmie_profile_path(farmie, 1)
    picture = fixture_file_upload("spec/fixtures/files/profile_pic.jpg", 'image/png', :binary)
    patch :update, params: {id: 1, farmie_id: farmie, picture: picture}
      #patch :update, params: { farmie: farmie, profile: 1, picture: picture }
      binding.pry
    expect(profile).to have_attributes(picture: 'profile_pic.jpg') 
	end

	def upload_profile_picture
		#File.open(Rails.root.join("spec/fixtures/files/profile_pic.jpg"))
    fixture_file_upload("spec/fixtures/files/profile_pic.jpg", 'image/png', :binary)
		#fixture_file_upload('spec/fixtures/files/profile_pic.jpg')
	end
=end

end
