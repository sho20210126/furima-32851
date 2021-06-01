class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @products = Product.all
  end

  def new
    @products = Product.new
  end

  def create
    @products = Product.new(product_params)
    if @products.save
       redirect_to root_path
    else
       render :new
    end
  end

  private
  def product_params
    params.require(:product).permit(:product_name, :product_description, :product_price, :product_status_id, :delivery_cost_id, :prefecture_id, :delivery_day_id, :delivery_category_id, :image).merge(user_id: current_user.id)
  end

end
