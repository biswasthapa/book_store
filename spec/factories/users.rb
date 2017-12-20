FactoryGirl.define do
  factory :user do
    email 'test_user@test.com'

    password "Foobar!23"

    password_confirmation { password }
  end
end