require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '商品出品機能' do
    before do
      @user = FactoryBot.create(:user)
      @product = FactoryBot.build(:product, user_id: @user.id)
    end

    context '登録できる時' do
      it '必要な情報を適切に入力すると、商品情報がデータベースに保存されること' do
        binding.pry
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

      it '販売価格は、¥300~¥9,999,999の間のみ保存可能であること' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price 300以上9999999以下で入力してください")
      end

      it '販売価格は半角数字のみ保存可能であること' do
        @product.price = '１０００'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price 半角数字を使用してください")
      end
    end
  end
  
end

# 商品画像を1枚つけることが必須であること
# 商品名が必須であること
# 商品の説明が必須であること
# カテゴリーの情報が必須であること
# 商品の状態についての情報が必須であること
# 配送料の負担についての情報が必須であること
# 発送元の地域についての情報が必須であること
# 発送までの日数についての情報が必須であること
# 販売価格についての情報が必須であること
# 販売価格は、¥300~¥9,999,999の間のみ保存可能であること
# 販売価格は半角数字のみ保存可能であること
# 入力された販売価格によって、販売手数料や販売利益の表示が変わること
# 必要な情報を適切に入力すると、商品情報がデータベースに保存されること
# エラーハンドリングができていること（入力に問題がある状態で「出品する」ボタンが押された場合、情報は保存されず、出品ページに戻りエラーメッセージが表示されること）
# エラーハンドリングの際、1つのエラーに対して同じエラーメッセージが重複して表示されないこと

# ユーザー新規登録
#     登録ができる時
#       nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること
#       パスワードは、6文字以上での入力が必須であること
#     登録ができない時
#       ニックネームが必須であること
#       emailが空だと登録できない
#       emailが一意性であること
#       メールアドレスは、@を含む必要があること
#       パスワードが必須であること
#       passwordが５文字以下であれば登録できないこと
#       パスワードは、半角英数字混合での入力が必須であること（半角英数字が混合されていれば、登録が可能なこと）
#       パスワードとパスワード（確認用）は、値の一致が必須であること
#       英字のみのとき登録できない
#       数字のみのとき登録できない
#       ユーザー本名は、名字が必須であること
#       ユーザー本名は、名前が必須であること
#       ユーザー本名は、名字が全角（漢字・ひらがな・カタカナ）での入力が必須であること
#       ユーザー本名は、名前が全角（漢字・ひらがな・カタカナ）での入力が必須であること
#       ユーザー本名のフリガナは、名字が必須であること
#       ユーザー本名のフリガナは、名前が必須であること
#       ユーザー本名の名字のフリガナは、全角（カタカナ）での入力が必須であること
#       ユーザー本名の名前のフリガナは、全角（カタカナ）での入力が必須であること
#       生年月日が必須であること
