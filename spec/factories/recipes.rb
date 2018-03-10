FactoryGirl.define do
  factory :recipe do
    name { Faker::Lorem.words(num = 2, supplemental = false) }
  end
end
