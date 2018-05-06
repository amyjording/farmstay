require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe "validations" do
  	it "has a valid factory" do
  		expect(FactoryBot.create(:farmie)).to be_valid
  		expect(FactoryBot.create(:profile)).to be_valid
  	end

  	it {should validate_presence_of(:farmie_id)}
    it {should validate_length_of(:intro)}
    it {should validate_length_of(:about)}
  end

  describe "associations" do
  	it {should belong_to(:farmie)}
    it {should have_many(:farmie_pictures)}
  end
end
