class UserChurchHeart < ActiveRecord::Base
  belongs_to :user
  belongs_to :church

  scope :likes, -> church {
    where(church: church, like: true)
  }

  def self.get_specific(user, church)
    self.find_by(user: user, church: church)
  end
end
