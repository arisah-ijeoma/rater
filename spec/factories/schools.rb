FactoryGirl.define do
  factory :school do
    name 'Federal University of Agriculture, Umudike'
    aka 'FUTO'
    date_founded '1989'
    location 'Owerri'
    ownership 'Federal'
    category 'University'
    head 'Maha'
    website 'futo.com.ng'
    avatar { fixture_file_upload(Rails.root.join('spec', 'support', 'rater.png'), 'image/png') }

    trait :invalid do
      name ''
    end

    factory :invalid_school, traits: [:invalid]
  end
end
