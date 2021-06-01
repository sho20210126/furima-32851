class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string     :product_name        , null: false
      t.text       :product_description         , null: false
      t.integer    :product_price     , null: false
      t.integer    :product_status_id     , null: false
      t.integer    :delivery_cost_id    , null: false
      t.integer    :prefecture_id    , null: false
      t.integer    :delivery_day_id    , null: false
      t.integer    :delivery_category_id     , null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
