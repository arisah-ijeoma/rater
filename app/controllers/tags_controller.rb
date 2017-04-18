class TagsController < ApplicationController
  before_action :find_tag, except: [:index, :new, :create]
  load_and_authorize_resource

  def index
    @tags = Tag.all
  end

  def new
    @tag = if request.original_url.include?('/pastor')
             PastorTag.new
           elsif request.original_url.include?('/church')
             ChurchTag.new
           elsif request.original_url.include?('/lecturer')
             LecturerTag.new
           elsif request.original_url.include?('/school')
             SchoolTag.new
           elsif request.original_url.include?('/brand')
             BrandTag.new
           elsif request.original_url.include?('/politician')
             PoliticianTag.new
           end
  end

  def create
    @tag = if request.original_url.include?('/pastor')
             PastorTag.new(tag_params)
           elsif request.original_url.include?('/church')
             ChurchTag.new(tag_params)
           elsif request.original_url.include?('/lecturer')
             LecturerTag.new(tag_params)
           elsif request.original_url.include?('/school')
             SchoolTag.new(tag_params)
           elsif request.original_url.include?('/brand')
             BrandTag.new(tag_params)
           elsif request.original_url.include?('/politician')
             PoliticianTag.new(tag_params)
           end

    @tag.description = params[:tag][:description]

    if @tag.save
      redirect_to home_index_path, notice: "Successfully added tag, #{@tag.description}"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @tag.description = params[:tag][:description]
    if @tag.update_attributes(tag_params)
      redirect_to tags_path, notice: "You have successfully updated #{@tag.description} tag"
    else
      render :edit
    end
  end

  def destroy
    @tag.destroy
    redirect_to tags_path, notice: "Successfully deleted"
  end

  private

  def tag_params
    params.permit(:description, :type)
  end

  def find_tag
    @tag = Tag.find_by(id: params[:tag_id])
  end
end
