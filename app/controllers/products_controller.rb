class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create]

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
    @product = Product.find(params[:id])
  end

  private
  def product_params
    params.require(:product).permit(:product_name, :product_description, :product_price, :product_status_id, :delivery_cost_id, :prefecture_id, :delivery_day_id, :delivery_category_id, :image).merge(user_id: current_user.id)
  end

end
