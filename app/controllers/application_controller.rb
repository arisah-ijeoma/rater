class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

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
      "devise"
    else
      "application"
    end
  end
end
