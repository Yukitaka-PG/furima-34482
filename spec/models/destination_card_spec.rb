require 'rails_helper'

RSpec.describe DestinationCard, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      product = FactoryBot.create(:product)
      @destination_card = FactoryBot.build(:destination_card, user_id: user.id, product_id: product.id)
      sleep(0.1)
    end

    context '登録できる時' do
      it '必要な情報を適切に入力すると、データがデータベースに保存されること' do
        expect(@destination_card).to be_valid
      end

      it '建物名が無くても登録できる' do
        expect(@destination_card).to be_valid
      end
    end

    context '登録できない時' do
      it '郵便番号が必須であること' do
        @destination_card.postal_code = ''
        @destination_card.valid?
        expect(@destination_card.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号の保存にはハイフンが必要であること（123-4567となる）' do
        @destination_card.postal_code = '1234567'
        @destination_card.valid?
        expect(@destination_card.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it '都道府県が必須であること' do
        @destination_card.prefecture_id = 1
        @destination_card.valid?
        expect(@destination_card.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it '市区町村が必須であること' do
        @destination_card.city = ''
        @destination_card.valid?
        expect(@destination_card.errors.full_messages).to include("City can't be blank")
      end

      it '番地が必須であること' do
        @destination_card.address = ''
        @destination_card.valid?
        expect(@destination_card.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が必須であること' do
        @destination_card.phone_number = ''
        @destination_card.valid?
        expect(@destination_card.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号は11桁以内の数値のみ保存可能なこと（09012345678となる）' do
        @destination_card.phone_number = '090123456789'
        @destination_card.valid?
        expect(@destination_card.errors.full_messages).to include("Phone number is invalid.")
      end

      it '電話番号にハイフンがあると登録できない' do
        @destination_card.phone_number = '090-1234567'
        @destination_card.valid?
        expect(@destination_card.errors.full_messages).to include("Phone number is invalid.")
      end

      it '電話番号は全角数字だと登録できないこと' do
        @destination_card.phone_number = '０９０１２３４５６７８'
        @destination_card.valid?
        expect(@destination_card.errors.full_messages).to include("Phone number is invalid.")
      end

      it 'クレジットカード情報が必須であること' do
        @destination_card.token = ''
        @destination_card.valid?
        expect(@destination_card.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが存在しない場合、購入できないこと' do
        @destination_card.user_id = ''
        @destination_card.valid?
        expect(@destination_card.errors.full_messages).to include("User can't be blank")
      end

      it 'product_idが存在しない場合、購入できないこと' do
        @destination_card.product_id = ''
        @destination_card.valid?
        expect(@destination_card.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end