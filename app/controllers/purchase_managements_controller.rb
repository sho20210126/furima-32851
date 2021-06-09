class PurchaseManagementsController < ApplicationController
  before_action :move_to_index, only: [:index, :create]

  def index
    @form_object = FormObject.new
    @product = Product.find(params[:product_id])
  end

  def create
    @product = Product.find(params[:product_id])
    @form_object = FormObject.new(order_params)
    if @form_object.valid?
      pay_product
      @form_object.save
      redirect_to root_path
    else
      render action: :index
    end

    
  end

  private

  def order_params
   params.require(:form_object).permit(:post_code, :prefecture_id, :municipality, :address, :build_name, :phone_number, :user_id, :product_id,).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @product.product_price,  
      card: order_params[:token],    
      currency: 'jpy'                 
    )
  end

  def move_to_index
    @product = Product.find(params[:product_id])
    if user_signed_in?
      if current_user.id == @product.user_id
        redirect_to root_path

      elsif @product.purchase_management.present?
        redirect_to root_path

      else

      end

    else redirect_to root_path

    end
  end

end
