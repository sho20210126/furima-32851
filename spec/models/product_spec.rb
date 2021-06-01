require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#create' do
    before do
      @product = FactoryBot.build(:product)
    end

    describe '商品出品機能' do
      context '商品出品登録がうまくいくとき' do
        it "必須入力項目が存在すれば登録できる" do
          expect(@product).to be_valid
        end
      end

      context '新規登録がうまくいかないとき' do
        it '出品画像が空では登録できないこと' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
        end

        it '商品名が空では登録できないこと' do
        @product.product_name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product name can't be blank")
        end

        it '商品の説明が空では登録できないこと' do
        @product.product_description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product description can't be blank")
        end

        it 'カテゴリーが---では登録できないこと' do
        @product.delivery_category_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery category must be other than 0")
        end

        it '商品状態が---では登録できないこと' do
        @product.product_status_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Product status must be other than 0")
        end

        it '配送料の負担が---では登録できないこと' do
        @product.delivery_cost_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery cost must be other than 0")
        end

        it '配送料の地域が---では登録できないこと' do
        @product.prefecture_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture must be other than 0")
        end

        it '発送までの日数が---では登録できないこと' do
        @product.delivery_day_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery day must be other than 0")
        end

        it '販売価格が空では登録できないこと' do
        @product.product_price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product price can't be blank")
        end

        it '299円以下では登録できないこと' do
        @product.product_price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include("Product price must be greater than or equal to 300")
        end

        it '10,000,000円以上では登録できないこと' do
        @product.product_price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include("Product price must be less than or equal to 9999999")
        end

        it '全角数字では登録できないこと' do
        @product.product_price = '３００'
        @product.valid?
        expect(@product.errors.full_messages).to include("Product price is not a number")
        end

        it '半角英数字混合では登録できないこと' do
        @product.product_price = '1AAA'
        @product.valid?
        expect(@product.errors.full_messages).to include("Product price is not a number")
        end
      end
    end
  end
end