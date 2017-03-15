class Church < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  has_many :pastors
  has_many :hearts, dependent: :destroy
  has_many :users, through: :hearts

  validates :name, :founder, presence: true
end
