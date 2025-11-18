class DashboardController < ApplicationController
  layout "dashboard"
  before_action :require_login

  def index
    @user = current_user
  end

  private

  def require_login
    unless session[:user_id]
      redirect_to root_path, alert: "Você precisa estar logado para acessar esta página"
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
