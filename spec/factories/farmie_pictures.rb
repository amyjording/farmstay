FactoryBot.define do
 factory :farmie_pictures do
  farmie :farmie
  Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/files/profile_pic.jpg"))
 	#fixture_file_upload('spec/fixtures/files/profile_pic.jpg')
 end
end