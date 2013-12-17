# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :auth_key do
    email "MyString"
    key "MyString"
  end
end
