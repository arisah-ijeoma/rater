class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Rater')
  end

  def new_addition(user, stuff)
    @user = user
    @stuff = stuff
    mail(to: @user.email, subject: 'New Stuff Added for Rating')
  end
end
