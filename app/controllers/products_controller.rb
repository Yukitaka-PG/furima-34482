class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def product_params
    params.require(:product).permit(:image, :title, :text, :product_category_id, :product_status_id, :burden_id, :prefecture_id, :days_id, :price).merge(user_id: current_user.id)
  end

end
