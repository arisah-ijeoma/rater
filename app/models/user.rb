class User < ActiveRecord::Base
  attr_accessor :login
  # attr_accessible :phone_number, :login

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         authentication_keys: [:login]

  @@states_and_capitals = LocationsNg::State.all
  NIGERIAN_STATES = @@states_and_capitals.map { |h| h.slice(:name).values }

  ACCOUNT_TYPES = %w( Student Lecturer Politician Pastor )

  validates :phone_number, :state_of_origin, :state_of_residence, presence: true
  validates :email, format: { with: Devise.email_regexp }
  validates :phone_number, format: { with: /[[:digit:]]{10}/ }, length: {minimum: 11, maximum: 14}

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["phone_number = :value OR lower(email) = :value", { value: login.downcase }]).first
    elsif conditions.has_key?(:phone_number) || conditions.has_key?(:email)
      where(conditions.to_hash).first
    end
  end
end
