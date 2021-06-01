class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  before_action :authenticate_user!
  def new
    #if user_signed_in? 
    @products = Product.new
    #else
      #edirect_to root_path
      #redirect_to action: :index
    #end
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
