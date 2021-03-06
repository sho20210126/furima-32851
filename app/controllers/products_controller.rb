class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
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
       redirect_to product_path
    else
       render :edit
    end
  end

  def destroy
    if @product.destroy
       redirect_to root_path
    end
  end

  private
  def product_params
    params.require(:product).permit(:product_name, :product_description, :product_price, :product_status_id, :delivery_cost_id, :prefecture_id, :delivery_day_id, :delivery_category_id, :image).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def move_to_index
    unless current_user.id == @product.user_id && @product.purchase_management.blank?
      redirect_to root_path
    end
  end

end
