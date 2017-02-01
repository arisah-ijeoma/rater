require 'rails_helper'

describe 'Devise', type: :feature do
  context 'sign up' do
    context 'valid sign up' do
      scenario 'user can sign up on page' do
        visit new_user_registration_path
        fill_in_user_details
        click_on 'Sign up'
        # add expectation when page has been designed
      end
    end

    context 'invalid sign up' do
      scenario 'user gets error with invalid data' do
        visit new_user_registration_path
        fill_in_invalid_user_details
        expect(page).to have_content('Email is invalid')
        expect(page).to have_content('Phone number is invalid')
      end
    end
  end

  def fill_in_user_details
    fill_in 'user_email', with: 'me@her.com'
    fill_in 'user_phone_number', with: '+234123456789'
    fill_in 'user_password', with: 'x.comske'
    fill_in 'user_password_confirmation', with: 'x.comske'
    select 'Abia', from: 'user_state_of_origin'
    select 'Lagos', from: 'user_state_of_residence'
  end

  def fill_in_invalid_user_details
    fill_in 'user_email', with: 'x.com'
    fill_in 'user_phone_number', with: 'abcdefghijk'
    fill_in 'user_password', with: 'x.comske'
    fill_in 'user_password_confirmation', with: 'x.comske'
    select 'Abia', from: 'user_state_of_origin'
    select 'Lagos', from: 'user_state_of_residence'
    click_on 'Sign up'
  end
end
