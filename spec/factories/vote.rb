FactoryGirl.define do

  factory :vote do
    vote { [0, 1, 2].sample }
  end
end
