FactoryGirl.define do

  factory :answer do
    content { "#{Faker::Lorem.sentences}" }
  end
end
