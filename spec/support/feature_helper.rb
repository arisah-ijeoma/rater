module FeatureHelper

  def email_login(a)
    fill_in 'user_login', with: a.email
    fill_in 'user_password', with: a.password
    click_button 'Log in'
  end

  def digits_login(a)
    fill_in 'user_login', with: a.phone_number
    fill_in 'user_password', with: a.password
    click_button 'Log in'
  end
end
