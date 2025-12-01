class SessionsController < ApplicationController
  layout "application"
  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path, notice: "Login realizado com sucesso"
    else
      flash.now[:alert] = "Email ou senha incorretos"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Você saiu da conta"
  end
end
