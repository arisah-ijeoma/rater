class HeartsController < ApplicationController
  before_action :find_church

  def like
    resource = UserChurchHeart.find_or_create_by(user: current_user, church: @church)
    resource.like = true
    resource.save
  end

  def unlike
    resource = UserChurchHeart.find_or_create_by(user: current_user, church: @church)
    resource.like = false
    resource.save
  end

  private

  def find_church
    @church = Church.find_by(id: params[:church_id])
  end
end
