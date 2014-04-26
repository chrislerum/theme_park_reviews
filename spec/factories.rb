FactoryGirl.define do
  factory :theme_park do
    name 'The Name'
    description 'The Description'
    location 'The Location'
  end

  factory :user do
    sequence(:email) { |e| "bobby#{e}@email.com"}
    password 'smileyface'
  end

  factory :rating do

  end
end
