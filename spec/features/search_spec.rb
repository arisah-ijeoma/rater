require 'rails_helper'

describe 'Search', type: :feature do

  let(:school_1) { create(:school) }
  let(:school_2) { create(:school, name: 'university of Alaska') }

  before do
    School.all << [school_1, school_2]
  end

  scenario 'search with partial string' do
    visit root_path
    fill_in 'q', with: 'un'
    find(:css, '.landing-search').click
    expect(page).to have_content('Umudike')
    expect(page).to have_content('Alaska')
  end
end
