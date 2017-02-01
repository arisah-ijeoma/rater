class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  @@states_and_capitals = LocationsNg::State.all
  NIGERIAN_STATES = @@states_and_capitals.map { |h| h.slice(:name).values }

  ACCOUNT_TYPES = %w( Student Lecturer Politician Pastor )
end
