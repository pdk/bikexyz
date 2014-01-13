# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order_product do
    order_id 1
    product_id 1
    xyz_code "MyString"
    count 1
  end
end
