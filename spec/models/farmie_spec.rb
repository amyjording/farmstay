require 'rails_helper'

RSpec.describe Farmie, type: :model do

  describe "validations" do
	  it "has a valid factory" do
	    expect(FactoryBot.create(:farmie)).to be_valid
	  end

	  it { should validate_presence_of(:first_name) }
	  it { should validate_presence_of(:last_name) }
	  it { should validate_presence_of(:email) }
	  it { should validate_presence_of(:password) }
	  it { should validate_presence_of(:password_confirmation)}

	end
end
