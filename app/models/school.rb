class School < ActiveRecord::Base
  before_validation :smart_add_website_protocol

  mount_uploader :avatar, AvatarUploader

  has_many :lecturers, dependent: :destroy

  validates :name, :location, :ownership, :category, :head, presence: true

  OWNERSHIP = %w( Federal State Private Missionary )
  CATEGORY = %w( University Polytechnic College Others )

  scope :aka_search, -> q {
    where('LOWER(aka) like ?', "%#{q.downcase}%")
  }

  private

  def smart_add_website_protocol
    unless self.website[/\Ahttp:\/\//] || self.website[/\Ahttps:\/\//]
      self.website = "http://#{self.website}"
    end
  end
end
