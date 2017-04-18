FactoryGirl.define do
  factory :tag, class: Tag do
    description 'Foodie'

    trait :invalid do
      description ''
    end

    factory :invalid_tag, traits: [:invalid]
  end
end
