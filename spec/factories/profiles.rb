FactoryGirl.define do
  factory :profile, class: Profile do
    state_of_origin 'Abia'
    state_of_residence 'Lagos'

    trait :bad_brief do
      brief Faker::Lorem.sentence(301)
    end

    factory :invalid_brief, traits: [:bad_brief]
  end
end
