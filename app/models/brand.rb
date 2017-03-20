class Brand < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  validates :name, :avatar, presence: true

  INDUSTRY = %w( Finance Telecoms )
end
