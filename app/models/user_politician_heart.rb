class UserPoliticianHeart < ActiveRecord::Base
  belongs_to :user
  belongs_to :politician

  scope :likes, -> politician {
    where(politician: politician, like: true)
  }

  def self.get_specific(user, politician)
    self.find_by(user: user, politician: politician)
  end
end
