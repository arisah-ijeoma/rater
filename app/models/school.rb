class School < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  has_many :lecturers, dependent: :destroy

  validates :name, :location, :ownership, :category, :head, presence: true

  OWNERSHIP = %w( Federal State Private Missionary )
  CATEGORY = %w( University Polytechnic College Others )

  scope :aka_search, -> q {
    where('LOWER(aka) like ?', "%#{q.downcase}%")
  }
end
