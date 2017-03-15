class Pastor < ActiveRecord::Base
  mount_uploader :image, AvatarUploader
  belongs_to :church
end
