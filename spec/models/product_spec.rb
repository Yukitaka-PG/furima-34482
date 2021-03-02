require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '商品出品機能' do
    before do
      @product = FactoryBot.build(:product)
    end

    context '登録できる時' do
      it '必要な情報を適切に入力すると、商品情報がデータベースに保存されること' do
        expect(@product).to be_valid
      end
    end

    context '登録できない時' do

      it '商品画像を1枚つけることが必須であること' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が必須であること' do
        @product.title = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Title can't be blank")
      end

      it '商品の説明が必須であること' do
        @product.text = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Text can't be blank")
      end

      it 'カテゴリーの情報が必須であること' do
        @product.product_category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Product category must be other than 1")
      end

      it '商品の状態についての情報が必須であること' do
        @product.product_status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Product status must be other than 1")
      end

      it '配送料の負担についての情報が必須であること' do
        @product.burden_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Burden must be other than 1")
      end

      it '発送元の地域についての情報が必須であること' do
        @product.prefecture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it '発送までの日数についての情報が必須であること' do
        @product.days_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Days must be other than 1")
      end

      it '販売価格についての情報が必須であること' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end

      it '299円以下では登録できない' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include("Price 300以上9999999以下で入力してください")
      end

      it '10,000,000円以上では登録できない' do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include("Price 300以上9999999以下で入力してください")
      end

      it '販売価格は半角数字のみ保存可能であること' do
        @product.price = '１０００'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price 半角数字を使用してください")
      end

      it '販売価格は半角英数混合では登録できないこと' do
        @product.price = 'a100'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price 半角数字を使用してください")
      end

      it '販売価格は半角英語だけでは登録できないこと' do
        @product.price = 'aaaa'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price 半角数字を使用してください")
      end
    end
  end
  
end