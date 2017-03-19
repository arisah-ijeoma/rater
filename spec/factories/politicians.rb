FactoryGirl.define do
  factory :politician, class: Politician do
    name 'Ijeoma Arisah'
    current_office 'Coder'
    date_assumed '2017-03-18 15:04:56'
    present_party 'Jay\'s Party'
    former_position 'Restricted Worker'
    avatar { fixture_file_upload(Rails.root.join('spec', 'support', 'rater.png'), 'image/png') }

    trait :invalid do
      name ''
    end

    factory :invalid_politician, traits: [:invalid]
  end
end
