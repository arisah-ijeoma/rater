class HomeController < ApplicationController
  require 'will_paginate/array'

  skip_before_action :authenticate_user!

  def index
    if params[:q].present?
      filtered_info = SearchDecorator.new.search_info(params[:q])
      @filtered_info = filtered_info.paginate(page: params[:page], per_page: 5)
    end
  end
end
