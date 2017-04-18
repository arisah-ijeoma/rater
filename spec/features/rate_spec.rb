require 'rails_helper'

describe 'Rate', type: :feature do

  let!(:church) { create(:church) }
  let(:user) { create(:user) }
  let!(:tag) { create(:tag, type: 'ChurchTag') }

  context 'logged in user' do
    before do
      email_login user
    end

    scenario 'rate church' do
      visit churches_path
      click_on church.name
      click_on 'Rate This Church'
      click_on 'Rate Church'
      expect(page).to have_content('Awesome')
      expect(page).to have_content('5.0')
    end

    scenario 'rate church and add tags' do
      visit churches_path
      click_on church.name
      click_on 'Rate This Church'
      check 'church_tag_'
      click_on 'Rate Church'
      expect(page).to have_content('Foodie')
    end
  end

  context 'not logged in' do
    scenario 'can not rate church' do
      visit churches_path
      click_on church.name
      click_on 'Rate This Church'
      expect(page).to have_content('You need to sign in or sign up before continuing')
    end
  end
end
