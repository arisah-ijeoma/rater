class PastorUser < ActiveRecord::Base
  belongs_to :pastor
  belongs_to :user
end
