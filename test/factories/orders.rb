# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    order_type 1
    name "MyString"
    address "MyString"
    city "MyString"
    state "MyString"
    zip "MyString"
  end
end
