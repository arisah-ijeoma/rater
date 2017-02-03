class User < ActiveRecord::Base
  attr_accessor :login
  after_create :add_profile

  has_one :profile

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         authentication_keys: [:login]

  @@states_and_capitals = LocationsNg::State.all
  NIGERIAN_STATES = @@states_and_capitals.map { |h| h.slice(:name).values }

  ACCOUNT_TYPES = %w( Anonymous Student Lecturer Politician Pastor )

  validates :phone_number, :state_of_origin, :state_of_residence, presence: true
  validates :email, format: { with: Devise.email_regexp }
  validates :phone_number, format: { with: /[[:digit:]]{10}/ }, length: {minimum: 11, maximum: 14}

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["phone_number = :value OR lower(email) = :value", { value: login.downcase }]).first
    else
      if conditions[:phone_number].nil?
        where(conditions).first
      else
        where(phone_number: conditions[:phone_number]).first
      end
    end
  end

  private

  def add_profile
    self.create_profile!(brief: "I am a Nigerian. Hear me roar!")
  end

  protected

  def self.send_reset_password_instructions(attributes = {})
    recoverable = find_recoverable_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
    recoverable.send_reset_password_instructions if recoverable.persisted?
    recoverable
  end

  def self.find_recoverable_or_initialize_with_errors(required_attributes, attributes, error=:invalid)
    (case_insensitive_keys || []).each {|k| attributes[k].try(:downcase!)}

    attributes = attributes.slice(*required_attributes)
    attributes.delete_if {|_key, value| value.blank?}

    if attributes.size == required_attributes.size
      if attributes.key?(:login)
        login = attributes.delete(:login)
        record = find_record(login)
      else
        record = where(attributes).first
      end
    end

    unless record
      record = new

      required_attributes.each do |key|
        value = attributes[key]
        record.send("#{key}=", value)
        record.errors.add(key, value.present? ? error : :blank)
      end
    end
    record
  end

  def self.find_record login
    where(["phone_number = :value OR email = :value", {value: login}]).first
  end
end
