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
    image_url "https://i.scdn.co/image/9f9d73b1c374fdcdb46b18a987790456e49f0720"
  end
end

FactoryGirl.define do
  factory :artist do
    name "Chanseur"
  end
end
