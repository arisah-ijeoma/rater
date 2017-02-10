require 'rails_helper'

describe 'Profile', type: :feature do
  let(:user) { build(:user) }

  scenario 'profile can not be updated without states' do
    sign_up(user)
    click_on 'Save Profile'
    expect(page).to have_content('can\'t be blank')
  end

  scenario 'profile is updated with states' do
    sign_up(user)
    select 'Abia', from: 'profile_state_of_origin'
    select 'Lagos', from: 'profile_state_of_residence'
    click_on 'Save Profile'
    expect(page).to have_content('Profile successfully updated')
  end

  scenario 'updating user attributes in profile updates user' do
    sign_up(user)
    update_profile
    click_on 'LogOut'
    log_in_with_updated_details
    click_on 'Log in'
    expect(page).to have_content('Signed in successfully')
  end

  scenario 'user can manage only his profile' do
    user1 = create(:user)
    user2 = create(:user, account_type: 'Politician')

    email_login(user1)

    visit "/profiles/#{user2.id}"
    expect(page).to have_content('You are not authorized to access this page')
  end

  def update_profile
    select 'Abia', from: 'profile_state_of_origin'
    select 'Lagos', from: 'profile_state_of_residence'
    fill_in 'profile_user_attributes_phone_number', with: '12341234123'
    click_on 'Save Profile'
  end

  def log_in_with_updated_details
    click_on 'Log In'
    fill_in 'user_login', with: '12341234123'
    fill_in 'user_password', with: 'password'
  end
end
