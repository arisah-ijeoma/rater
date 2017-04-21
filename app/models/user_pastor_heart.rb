class UserPastorHeart < ActiveRecord::Base
  belongs_to :user
  belongs_to :pastor

  scope :likes, -> pastor {
    where(pastor: pastor, like: true)
  }

  def self.get_specific(user, pastor)
    self.find_by(user: user, pastor: pastor)
  end
end
