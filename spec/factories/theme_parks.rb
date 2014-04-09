# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :theme_park do
    name "MyString"
    description "MyText"
    location "MyString"
    rating 1
  end
end
