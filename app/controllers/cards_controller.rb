class CardsController < ApplicationController
  before_action :set_product, only: [:index, :create]
  before_action :move_to_index, only: [:index]

  def index
    @destination_card = DestinationCard.new
  end

  def create
    @destination_card = DestinationCard.new(destination_card_params)
    if @destination_card.valid?
      pay_product
      @destination_card.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def destination_card_params
    params.require(:destination_card).permit(:postal_code, :city, :address, :house_name, :phone_number, :burden_id, :prefecture_id).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,
      card: destination_card_params[:token],
      currency: 'jpy'
    )
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def move_to_index
    unless user_signed_in? && @product.card.blank?
      redirect_to root_path
    end
  end
end
