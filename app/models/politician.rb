class Politician < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  validates :name, :current_office, :avatar, presence: true
end
