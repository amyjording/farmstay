FactoryBot.define do
  factory :profile do
    intro Faker::Lorem.sentence(3, true, 6)
    about Faker::Lorem.paragraph(2, true, 4)
    farmie_id 1
    show_visited_farms true
  end
end

#FactoryBot.define do
#  factory :picture, parent: :profile do
#    picture File.open(File.join(Rails.root, 'spec', 'fixtures', 'files', 'profile_pic.jpg'))
#  end
# end