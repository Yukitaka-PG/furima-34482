require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '登録ができる時' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること' do
        expect(@user).to be_valid
      end

      it 'パスワードは、6文字以上での入力が必須であること' do
        @user.password = '12345a'
        @user.password_confirmation = '12345a'
        expect(@user).to be_valid
      end
    end

    context '登録ができない時' do
      it 'ニックネームが必須であること' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスは、@を含む必要があること' do
        @user.email = 'test1test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'パスワードが必須であること' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが５文字以下であれば登録できないこと' do
        @user.password = 'a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'パスワードは、半角英数字混合での入力が必須であること（半角英数字が混合されていれば、登録が可能なこと）' do
        @user.password = '11111Ａ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end

      it 'パスワードとパスワード（確認用）は、値の一致が必須であること' do
        @user.password = 'a12345'
        @user.password_confirmation = 'a123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '英字のみのとき登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end

      it '数字のみのとき登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end

      it 'ユーザー本名は、名字が必須であること' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank", 'Family name 全角文字を使用してください')
      end

      it 'ユーザー本名は、名前が必須であること' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", 'First name 全角文字を使用してください')
      end

      it 'ユーザー本名は、名字が全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.family_name = 'english'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name 全角文字を使用してください')
      end

      it 'ユーザー本名は、名前が全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.first_name = 'english'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
      end

      it 'ユーザー本名のフリガナは、名字が必須であること' do
        @user.family_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name katakana can't be blank")
      end

      it 'ユーザー本名のフリガナは、名前が必須であること' do
        @user.first_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana can't be blank")
      end

      it 'ユーザー本名の名字のフリガナは、全角（カタカナ）での入力が必須であること' do
        @user.family_name_katakana = 'ｶﾀｶﾅ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name katakana 全角カタカナを使用してください')
      end

      it 'ユーザー本名の名前のフリガナは、全角（カタカナ）での入力が必須であること' do
        @user.first_name_katakana = 'ｶﾀｶﾅ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name katakana 全角カタカナを使用してください')
      end

      it '生年月日が必須であること' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
