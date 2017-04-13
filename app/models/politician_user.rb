class PoliticianUser < ActiveRecord::Base
  belongs_to :politician
  belongs_to :user
end
