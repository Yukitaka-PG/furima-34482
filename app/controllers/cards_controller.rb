class CardsController < ApplicationController

  def index
    @destination_card = DestinationCard.new
  end

  def create
    @destination_card = DestinationCard.new(destination_card_params)
    if @destination_card.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def destination_card_params
    params.permit(:destination_card).permit(:postal_code, :city, :address, :house_name, :phone_number, :burden_id, :prefecture_id, :product_id).merge(user_id: current_user.id)
  end
end
