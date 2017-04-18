class Tag < ActiveRecord::Base
  validates :description, presence: true

  LIST = %w( ChurchTag PastorTag SchoolTag LecturerTag BrandTag PoliticianTag )

  scope :filter, -> (cat) {
    where(type: cat)
  }
end
