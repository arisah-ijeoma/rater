class HeartsController < ApplicationController
  before_action :find_church, :find_pastor

  def like
    resource = select_like_table
    resource.like = true
    resource.save
  end

  def unlike
    resource = select_like_table
    resource.like = false
    resource.save
  end

  private

  def select_like_table
    url = request.original_url

    if url.include?('/pastor')
      UserPastorHeart.find_or_create_by(user: current_user, pastor: @pastor)
    elsif url.include?('/church')
      UserChurchHeart.find_or_create_by(user: current_user, church: @church)
    # elsif url.include?('/lecturer')
    #   UserLecturerHeart.find_or_create_by(user: current_user, church: @lecturer)
    # elsif url.include?('/school')
    #   UserSchoolHeart.find_or_create_by(user: current_user, church: @school)
    # elsif url.include?('/brand')
    #   UserBrandHeart.find_or_create_by(user: current_user, church: @brand)
    # elsif url.include?('/politician')
    #   UserPoliticianHeart.find_or_create_by(user: current_user, church: @politician)
    end
  end

  def find_church
    @church = Church.find_by(id: params[:church_id])
  end

  def find_pastor
    @pastor = Pastor.find_by(id: params[:pastor_id])
  end
end
