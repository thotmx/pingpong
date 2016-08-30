FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@mail.com" }
    password "12345678" 
    password_confirmation "12345678" 
  end
end
