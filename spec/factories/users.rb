FactoryGirl.define do
  factory :user, class: User do
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
    phone_number '07033778280'

    trait :admin_user do
      admin true
    end

    factory :admin, traits: [:admin_user]
  end
end
