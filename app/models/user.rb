class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  @@states_and_capitals = LocationsNg::State.all
  NIGERIAN_STATES = @@states_and_capitals.map { |h| h.slice(:name).values }

  ACCOUNT_TYPES = %w( Student Lecturer Politician Pastor )

  validates :phone_number, :state_of_origin, :state_of_residence, presence: true
  validates :email, format: { with: Devise.email_regexp }
  validates :phone_number, format: { with: /[[:digit:]]{10}/ }, length: {minimum: 11, maximum: 14}

end
