class HeartsController < ApplicationController
  before_action :find_church, :find_pastor, :find_school, :find_lecturer, :find_brand

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
    elsif url.include?('/lecturer')
      UserLecturerHeart.find_or_create_by(user: current_user, lecturer: @lecturer)
    elsif url.include?('/school')
      UserSchoolHeart.find_or_create_by(user: current_user, school: @school)
    elsif url.include?('/brand')
      UserBrandHeart.find_or_create_by(user: current_user, brand: @brand)
    # elsif url.include?('/politician')
    #   UserPoliticianHeart.find_or_create_by(user: current_user, politician: @politician)
    end
  end

  def find_church
    @church = Church.find_by(id: params[:church_id])
  end

  def find_pastor
    @pastor = Pastor.find_by(id: params[:pastor_id])
  end

  def find_school
    @school = School.find_by(id: params[:school_id])
  end

  def find_lecturer
    @lecturer = Lecturer.find_by(id: params[:lecturer_id])
  end

  def find_brand
    @brand = Brand.find_by(id: params[:brand_id])
  end
end
