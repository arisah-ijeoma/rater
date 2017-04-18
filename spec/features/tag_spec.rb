require 'rails_helper'

describe 'Tag', type: :feature do

  let(:tag_1) { create(:tag, type: 'ChurchTag') }
  let(:tag_2) { create(:tag, description: 'Dance', type: 'PastorTag') }
  let(:admin) { create(:admin) }

  before do
    Tag.all << [tag_1, tag_2]
    email_login admin
  end

  scenario 'filter by type' do
    visit tags_path(filter_by: 'ChurchTag')
    expect(page).to have_content('Foodie')
    expect(page).not_to have_content('Dance')
  end
end
