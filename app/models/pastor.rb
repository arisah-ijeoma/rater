class Pastor < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :church

  validates :name, :avatar, presence: true
end
