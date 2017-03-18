FactoryGirl.define do
  factory :lecturer do
    name 'My Prince'
    course 'Love 101'
    avatar { fixture_file_upload(Rails.root.join('spec', 'support', 'rater.png'), 'image/png') }
    association(:school)

    trait :invalid do
      name ''
    end

    factory :invalid_lecturer, traits: [:invalid]
  end
end
