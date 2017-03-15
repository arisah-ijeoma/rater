FactoryGirl.define do
  factory :church, class: Church do
    name 'Redeemed Christian Church of God'
    aka 'RCCG'
    date_founded '1909'
    founder 'Jesus Christ'
    website 'www.rccg.com'
    avatar { fixture_file_upload(Rails.root.join('spec', 'support', 'rater.png'), 'image/png') }

    trait :invalid do
      name ''
      founder ''
    end

    factory :invalid_church, traits: [:invalid]
  end
end
