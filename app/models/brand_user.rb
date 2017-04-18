class BrandUser < ActiveRecord::Base
  belongs_to :brand
  belongs_to :user

  scope :rating, -> brand {
    where(brand: brand)
  }
end
