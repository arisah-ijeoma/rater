class Profile < ActiveRecord::Base
  belongs_to :user

  delegate :email,
           :password,
           :password_confirmation,
           :phone_number,
           :account_type,
           :state_of_origin,
           :state_of_residence,
           to: :user,
           allow_nil: true
end
