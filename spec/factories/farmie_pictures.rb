FactoryBot.define do
 factory :farmie_picture do
    image_path { Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/files/toads.jpg")) }
    #attach_file "profile[farmie_pictures_attributes][][image_path]", ("files/toads.jpg")
    #attach_file "profile[farmie_pictures_attributes][][image_path]", ("files/garden.jpg")
 	 # let(:farmie_picture) {fixture_file_upload('/files/profile_pic.jpg', 'image/jpg')}
 end
end
