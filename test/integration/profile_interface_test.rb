require 'test_helper'


class ProfileInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @farmie = FactoryBot.create(:farmie)
  end

  test "picture upload" do
    sign_in(@farmie)
    get edit_farmie_profile_path(@farmie.id, @farmie.profile.id)
    # Valid submission
    content = "This really ties the room together"
    about = "Blah blah blah blah blah blah blah"
    picture = fixture_file_upload('files/profile_pic.jpg', 'image/jpg')
    patch farmie_profile_url(@farmie.profile.id), params: { profile: { id: @farmie.profile.id, farmie_id: @farmie.id, intro: content, about: about } } #, picture: picture
    binding.pry
    assert assigns(@farmie.profile).picture?
    follow_redirect!
    assert_match content, response.body
  end


end