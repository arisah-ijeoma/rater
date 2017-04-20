class Church < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  has_many :pastors, dependent: :destroy

  validates :name, :founder, presence: true

  scope :aka_search, -> q {
    where('LOWER(aka) like ?', "%#{q.downcase}%")
  }
end
