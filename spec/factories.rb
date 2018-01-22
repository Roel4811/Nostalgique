FactoryGirl.define do
  factory :member do
    sequence(:email) { |n| "foo#{n}@example.com" }
    password "secret"
  end
end
