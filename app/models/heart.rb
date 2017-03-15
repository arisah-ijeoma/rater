class Heart < ActiveRecord::Base
  belongs_to :church
  belongs_to :user

  validates :user_id, uniqueness: { scope: :church_id }
end
