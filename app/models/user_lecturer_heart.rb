class UserLecturerHeart < ActiveRecord::Base
  belongs_to :user
  belongs_to :lecturer

  scope :likes, -> lecturer {
    where(lecturer: lecturer, like: true)
  }

  def self.get_specific(user, lecturer)
    self.find_by(user: user, lecturer: lecturer)
  end
end
