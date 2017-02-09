module FeatureHelper

  def email_login(a)
    visit new_user_session_path
    fill_in 'user_login', with: a.email
    fill_in 'user_password', with: a.password
    click_button 'Log in'
  end

  def digits_login(a)
    visit new_user_session_path
    fill_in 'user_login', with: a.phone_number
    fill_in 'user_password', with: a.password
    click_button 'Log in'
  end

  def sign_up(u)
    visit new_user_registration_path
    fill_in 'user_email', with: u.email
    fill_in 'user_phone_number', with: u.phone_number
    fill_in 'user_password', with: u.password
    fill_in 'user_password_confirmation', with: u.password_confirmation
    click_button 'Sign up'
  end
end
