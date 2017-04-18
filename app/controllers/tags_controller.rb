class TagsController < ApplicationController
  before_action :find_tag, except: [:index, :new, :create]
  load_and_authorize_resource

  def index
    @tags = if params[:filter_by].present?
              Tag.filter(params[:filter_by]).paginate(page: params[:page], per_page: 7)
            else
              Tag.all.paginate(page: params[:page], per_page: 7)
            end
  end

  def new
    url = request.original_url
    decorator = TagDecorator.new(url)
    @tag = decorator.new_tag
  end

  def create
    url = request.original_url
    decorator = TagDecorator.new(url)
    @tag = decorator.create_tag(tag_params)

    @tag.description = params[:tag][:description]

    if @tag.save
      redirect_to tags_path, notice: "Successfully added tag, #{@tag.description}"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @tag.description = params[:tag][:description]
    if @tag.update_attributes(tag_params)
      redirect_to tags_path, notice: "You have successfully updated #{@tag.description}"
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
