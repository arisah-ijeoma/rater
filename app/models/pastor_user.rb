class PastorUser < ActiveRecord::Base
  belongs_to :pastor
  belongs_to :user

  scope :rating, -> pastor {
    where(pastor: pastor)
  }
end
