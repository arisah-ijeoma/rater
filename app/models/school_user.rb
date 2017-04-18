class SchoolUser < ActiveRecord::Base
  belongs_to :school
  belongs_to :user

  scope :rating, -> school {
    where(school: school)
  }
end
