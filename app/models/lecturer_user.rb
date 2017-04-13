class LecturerUser < ActiveRecord::Base
  belongs_to :lecturer
  belongs_to :user
end
