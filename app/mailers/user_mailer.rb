class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Rater')
  end

  def new_addition(stuff)
    @stuff = stuff
    mail(to: @user.email, subject: 'New Item Added for Rating')
  end
end
