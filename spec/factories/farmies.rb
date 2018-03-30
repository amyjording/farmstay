FactoryBot.define do
	factory :farmie do
		first_name { Faker::Name.first_name }
		last_name { Faker::Name.last_name }
		email { Faker::Internet.email }
		password {'passweird1234'}
		password_confirmation {'passweird1234'}
	end
end