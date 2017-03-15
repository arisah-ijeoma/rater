class Profile < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  belongs_to :user

  delegate :email,
           :password,
           :password_confirmation,
           :phone_number,
           :account_type,
           to: :user,
           allow_nil: true

  accepts_nested_attributes_for :user

  validates :state_of_origin, :state_of_residence, presence: true, on: :update
  validates :brief, length: { maximum: 150, too_long: "%{count} characters is the maximum allowed" }

  NIGERIAN_STATES = [
      'Abia',
      'Adamawa',
      'Akwa Ibom',
      'Anambra',
      'Bauchi',
      'Bayelsa',
      'Benue',
      'Borno',
      'Cross River',
      'Delta',
      'Ebonyi',
      'Edo',
      'Ekiti',
      'Enugu',
      'Federal Capital Territory',
      'Gombe',
      'Imo',
      'Jigawa',
      'Kaduna',
      'Kano',
      'Katsina',
      'Kebbi',
      'Kogi',
      'Kwara',
      'Lagos',
      'Nasarawa',
      'Niger',
      'Ogun',
      'Ondo',
      'Osun',
      'Oyo',
      'Plateau',
      'Rivers',
      'Sokoto',
      'Taraba',
      'Yobe',
      'Zamfara'
  ]
end
