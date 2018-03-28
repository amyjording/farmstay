FactoryBot.define do
	factory :farmie do
		email { Faker::Internet.email }
		password {Devise.friendly_token.first(8)}
	end
end