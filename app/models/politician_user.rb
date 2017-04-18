class PoliticianUser < ActiveRecord::Base
  belongs_to :politician
  belongs_to :user

  scope :rating, -> politician {
    where(politician: politician)
  }
end
