FactoryGirl.define do
  factory :user, class: User do
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
    phone_number '07033778280'
  end
end
