FactoryGirl.define do
  factory :book do
    title "MyString"
    description "MyText"
    unit_price 1.5
    author nil
    category nil
    publisher nil
  end
end
