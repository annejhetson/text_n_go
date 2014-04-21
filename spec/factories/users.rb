FactoryGirl.define do
  sequence :phone do |n|
    "111111111#{n}"
  end

  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :user do
    name 'Bob'
    phone
    email
    password "123"
  end
end
