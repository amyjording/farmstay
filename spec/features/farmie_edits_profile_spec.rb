require 'rails_helper'

feature "farmie profiles" do

  let(:farmie) {FactoryBot.create(:farmie)}
  #let(:picture) {FactoryBot.create(:picture)}
  let(:uploader) { PictureUploader.new(farmie, :picture) }

  before do
    login_as(farmie, scope: :farmie,
      run_callbacks: :false)

    PictureUploader.enable_processing = true
    File.open(File.join(Rails.root,'spec', 'fixtures', 'files', 'profile_pic.jpg')) { |f| uploader.store!(f) }
  end

  after do
    PictureUploader.enable_processing = false
    uploader.remove!
  end

	scenario "farmie edits their profile" do
		visit edit_farmie_profile_path(farmie, 1)
		expect(page).to have_css("img[src*='farmer-penguin']")
    uploader
    fill_in "profile[name]", with: Faker::Name.initials(2)
		fill_in "profile[intro]", with: Faker::Lorem.sentence(3, true, 10)
		fill_in "profile[about]", with: Faker::Lorem.paragraph(2, true, 4)
		choose "Yes"
    click_button "Update profile"
    expect(farmie.profile).to have_attributes(picture: "profile_pic.jpg")
		expect(page).to have_content("Profile updated")
		profile = Profile.last
		expect(profile.show_visited_farms).to eq true
  end

end
