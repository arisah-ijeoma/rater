class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_styling, :authenticate_user!

  layout :layout_by_resource

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to home_index_path, alert: exception.message
  end

  private

  def current_user
    return @_logged_in_user if defined?(@_logged_in_user)
    warden = request.env["warden"]
    @_logged_in_user = warden && warden.user(:user)
  end
  helper_method :current_user

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end

  protected

  def layout_by_resource
    if devise_controller?
      'devise'
    elsif controller_name == 'landing'
      'landing'
    else
      'application'
    end
  end

  def set_styling
    if controller_name == 'landing' || devise_controller?
      @css_root = 'landing/application'
    else
      @css_root = 'application'
    end
  end
end
