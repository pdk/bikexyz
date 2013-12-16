# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bike_reg do
    serial_number "MyString"
    color "MyString"
    brand "MyString"
    model "MyString"
    kind "MyString"
    size "MyString"
    number_of_gears 1
    notes "MyText"
    name "MyString"
    alternate_name "MyString"
    city "MyString"
    state "MyString"
    country "MyString"
    primary_email "MyString"
    second_email "MyString"
    third_email "MyString"
    cell_phone_one "MyString"
    cell_phone_two "MyString"
  end
end
