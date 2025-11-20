class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :set_current_user

  allow_browser versions: :modern

  private

  def set_current_user
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    end
  end

  stale_when_importmap_changes

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def require_login
    unless current_user
      redirect_to login_path, alert: "Você precisa fazer o login"
    end
  end
end
