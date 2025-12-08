class CardsController < ApplicationController
  before_action :require_login
  before_action :set_card, only: [ :edit, :update, :destroy ]

  def create
    @card = current_user.cards.build(card_params)

    if @card.save
      render json: @card, status: :created
    else
      render json: { errors: @card.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @card.update(card_params)
      render json: @card, status: :ok
    else
      render json: { errors: @card.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @card.destroy
      render json: { success: true }, status: :ok
    else
      render json: { errors: [ "Erro ao apagar o card" ] }, status: :unprocessable_entity
    end
  end


  private

  def set_card
    @card = current_user.cards.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:title, :value, :color)
  end
end
