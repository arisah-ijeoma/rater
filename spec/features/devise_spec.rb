require 'rails_helper'

describe 'Devise', type: :feature do
  let(:user) { create(:user) }

  context 'sign up' do
    context 'valid sign up' do
      scenario 'user can sign up on page' do
        visit new_user_registration_path
        fill_in_user_details
        click_on 'Sign up'
        expect(page).to have_content('Edit Your Profile')
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

  context 'sign in' do
    context 'valid sign in' do
      scenario 'user can sign in with email' do
        email_login user
        expect(page).to have_content('LogOut')
      end

      scenario 'user can sign in with phone number' do
        digits_login user
        expect(page).to have_content('LogOut')
      end
    end

    context 'invalid sign in' do
      scenario 'user gets error with invalid data' do
        visit new_user_session_path
        fill_in 'user_login', with: 'hungry.com'
        fill_in 'user_password', with: '12345679'
        click_on 'Log in'
        expect(page).to have_content('Invalid phone number or email or password.')
      end
    end
  end

  context 'reset password' do
    context 'valid reset' do
      scenario 'user can sign in with email' do
        visit new_user_password_path
        fill_in 'user_login', with: user.phone_number
        click_on 'Reset Password'
        expect(page).to have_content('You will receive an email with instructions on how to reset your password in a few minutes.')
      end
    end

    context 'invalid reset' do
      scenario 'user gets error with invalid phone number or email' do
        visit new_user_password_path
        fill_in 'user_login', with: 'me.com'
        click_on 'Reset Password'
        expect(page).to have_content('phone number or email can\'t be blank')
      end
    end
  end

  def fill_in_user_details
    fill_in 'user_email', with: 'me@her.com'
    fill_in 'user_phone_number', with: '+234123456789'
    fill_in 'user_password', with: 'x.comske'
    fill_in 'user_password_confirmation', with: 'x.comske'
  end

  def fill_in_invalid_user_details
    fill_in 'user_email', with: 'x.com'
    fill_in 'user_phone_number', with: 'abcdefghijk'
    fill_in 'user_password', with: 'x.comske'
    fill_in 'user_password_confirmation', with: 'x.comske'
    click_on 'Sign up'
  end
end
