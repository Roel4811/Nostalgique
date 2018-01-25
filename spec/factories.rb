FactoryGirl.define do
  factory :member do
    sequence(:email) { |n| "foo#{n}@example.com" }
    password "secret"
  end
end

FactoryGirl.define do
  factory :song do
    name "test_song"
    lyrics "lalalyrics"
  end
end

FactoryGirl.define do
  factory :artist do
    name "Chanseur"
  end
end
