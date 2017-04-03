class Church < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  has_many :pastors, dependent: :destroy
  # has_many :hearts, dependent: :destroy
  # has_many :users, through: :hearts

  validates :name, :founder, presence: true

  scope :aka_search, -> q {
    where('LOWER(aka) like ?', "%#{q.downcase}%")
  }
end
