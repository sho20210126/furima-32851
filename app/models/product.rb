class Product < ApplicationRecord
   has_one :purchase_management
   belongs_to :user
   has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :product_status
  belongs_to :delivery_cost
  belongs_to :prefecture
  belongs_to :delivery_day
  belongs_to :delivery_category

  #空の投稿を保存できないようにする
  with_options presence: true do
    validates :image
    validates :product_name
    validates :product_description
    validates :product_price
    validates :product_status_id
    validates :delivery_cost_id
    validates :prefecture_id
    validates :delivery_day_id
    validates :delivery_category_id
    
  end
    #ジャンルの選択が「--」の時は保存できないようにする
    with_options numericality: { other_than: 0 } do
    validates :delivery_category_id
    validates :product_status_id
    validates :delivery_cost_id
    validates :prefecture_id
    validates :delivery_day_id
    end
    #価格の範囲が、¥300~¥9,999,999の間であるようにする
    validates :product_price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end

