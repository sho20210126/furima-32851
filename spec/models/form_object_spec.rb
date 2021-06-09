require 'rails_helper'

RSpec.describe FormObject, type: :model do
  describe '#create' do
    before do
      @form_object = FactoryBot.build(:form_object)
    end

    describe '商品購入機能' do
      context '商品購入登録がうまくいくとき' do
        it "必須入力項目が存在すれば登録できる" do
          expect(@form_object).to be_valid
        end

        it '建物名が抜けていても登録できること' do
          @form_object.build_name = ''
          expect(@form_object).to be_valid
          end
      end

      context '購入登録がうまくいかないとき' do
        it '郵便番号が空では登録できないこと' do
        @form_object.post_code = ''
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Post code can't be blank")
        end

        it '郵便番号がハイフンなしでは登録できないこと' do
        @form_object.post_code = '1234567'
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
        end

        it '都道府県が--では登録できないこと' do
        @form_object.prefecture_id = 0
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Prefecture can't be blank")
        end

        it '市区町村が空では登録できないこと' do
        @form_object.municipality = ''
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Municipality can't be blank")
        end

        it '番地が空では登録できないこと' do
        @form_object.address= ''
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Address can't be blank")
        end

        it '電話番号が空では登録できないこと' do
        @form_object.phone_number = ''
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Phone number can't be blank")
        end

        it '電話番号が12桁以上では登録できないこと' do
        @form_object.phone_number = '123456789012'
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Phone number is invalid")
        end

        it '電話番号が9桁未満では登録できないこと' do
        @form_object.phone_number = '123456789'
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Phone number is invalid")
        end

        it '電話番号がハイフン有では登録できないこと' do
        @form_object.phone_number = '000-1111-2222'
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Phone number is invalid")
        end

        it '電話番号が英数字混合では登録できないこと' do
          @form_object.phone_number = '0001111222A'
          @form_object.valid?
          expect(@form_object.errors.full_messages).to include("Phone number is invalid")
        end

        it 'user_idが空では登録できないこと' do
          @form_object.user_id = ''
          @form_object.valid?
          expect(@form_object.errors.full_messages).to include("User can't be blank")
        end

        it 'product_idが空では登録できないこと' do
          @form_object.product_id = ''
          @form_object.valid?
          expect(@form_object.errors.full_messages).to include("Product can't be blank")
        end

        it 'クレジットカード情報が空では登録できないこと' do
          @form_object.token = ''
          @form_object.valid?
          expect(@form_object.errors.full_messages).to include("Token can't be blank")
        end
      end
    end
  
  end
end
