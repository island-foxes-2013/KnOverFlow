FactoryGirl.define do

  factory :question do
    title   { Faker::Lorem.sentence }
    content { Faker::Lorem.sentences }
  end
end
