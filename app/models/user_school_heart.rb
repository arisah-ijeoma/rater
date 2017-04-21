class UserSchoolHeart < ActiveRecord::Base
  belongs_to :user
  belongs_to :school

  scope :likes, -> school {
    where(school: school, like: true)
  }

  def self.get_specific(user, school)
    self.find_by(user: user, school: school)
  end
end
