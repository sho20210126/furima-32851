class FormObject

  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality, :address, :build_name, :phone_number, :user_id, :product_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/}
    validates :token
    validates :user_id
    validates :product_id
  end

  def save
    purchase_management = PurchaseManagement.create(user_id: user_id, product_id: product_id)
    Destination.create(post_code: post_code,prefecture_id: prefecture_id, municipality: municipality, address: address, build_name: build_name, phone_number: phone_number, purchase_management_id: purchase_management.id)
  end
end