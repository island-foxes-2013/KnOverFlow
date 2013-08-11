FactoryGirl.define do

  factory :vote do
    up_voted { [true, false].sample }
  end
end
