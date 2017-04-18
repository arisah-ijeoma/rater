class LecturerUser < ActiveRecord::Base
  belongs_to :lecturer
  belongs_to :user

  scope :rating, -> lecturer {
    where(lecturer: lecturer)
  }
end
