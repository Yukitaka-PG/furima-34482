class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_product, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @products = Product.all.order("created_at DESC")
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

  def show
    
  end

  def edit
    
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end  
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  private
  def product_params
    params.require(:product).permit(:image, :title, :text, :product_category_id, :product_status_id, :burden_id, :prefecture_id, :days_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless current_user.id == @product.user.id
      redirect_to action: :index
    end
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
