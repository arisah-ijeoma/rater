class Lecturer < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :school

  validates :name, :course, :avatar, presence: true
end
