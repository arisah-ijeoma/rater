FactoryGirl.define do
  factory :brand, class: Brand do
    name 'MTN'
    managed_by 'Ijeoma Arisah'
    industry 'Telecoms'
    avatar { fixture_file_upload(Rails.root.join('spec', 'support', 'rater.png'), 'image/png') }

    trait :invalid do
      name ''
    end

    factory :invalid_brand, traits: [:invalid]
  end
end
