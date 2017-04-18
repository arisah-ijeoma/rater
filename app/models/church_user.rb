class ChurchUser < ActiveRecord::Base
  belongs_to :church
  belongs_to :user

  scope :rating, -> church {
    where(church: church)
  }
end
