FactoryGirl.define do
  factory :pastor do
    name 'E.A. Adeboye'
    avatar { fixture_file_upload(Rails.root.join('spec', 'support', 'rater.png'), 'image/png') }
    association(:church)

    trait :invalid do
      name ''
    end

    factory :invalid_pastor, traits: [:invalid]
  end
end
