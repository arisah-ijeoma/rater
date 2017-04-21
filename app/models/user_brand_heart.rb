class UserBrandHeart < ActiveRecord::Base
  belongs_to :user
  belongs_to :brand

  scope :likes, -> brand {
    where(brand: brand, like: true)
  }

  def self.get_specific(user, brand)
    self.find_by(user: user, brand: brand)
  end
end
