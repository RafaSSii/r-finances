class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.autheticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Login realizado com sucesso"
    else
      flash.now[:alert] = "Email ou senha incorretos"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session.clear
    redirect_to root_path, notice: "Você saiu da conta"
  end
end
