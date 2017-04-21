class Church < ActiveRecord::Base
  before_validation :smart_add_website_protocol

  mount_uploader :avatar, AvatarUploader

  has_many :pastors, dependent: :destroy

  validates :name, :founder, presence: true

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
