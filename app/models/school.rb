class School < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  has_many :lecturers, dependent: :destroy
  has_many :hearts, dependent: :destroy
  has_many :users, through: :hearts

  validates :name, :location, :ownership, :category, :head, presence: true

  OWNERSHIP = %w( Federal State Private Missionary )
  CATEGORY = %w( University Polytechnic College Others )
end
