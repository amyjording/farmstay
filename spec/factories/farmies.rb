FactoryBot.define do
	factory :farmie do
		first_name { Faker::Name.first_name }
		last_name { Faker::Name.last_name }
		email { Faker::Internet.email }
		password {'passweird1234'}
		password_confirmation {'passweird1234'}
    admin false
	end
end

FactoryBot.define do
  factory :admin, class: Farmie do
    first_name "Admin"
    last_name  "User"
    email { Faker::Internet.email }
    password {'password12'}
    password_confirmation {'password12'}
    admin      true
  end
end