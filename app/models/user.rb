class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :first_name
    validates :family_name
    validates :first_name_katakana
    validates :family_name_katakana
    validates :birthday
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  PASSWORD_REGEX = /\A[ぁ-んァ-ヶ一-龥々]+\z/.freeze
  validates_format_of :first_name, :family_name, with: PASSWORD_REGEX, message: '全角文字を使用してください'

  PASSWORD_REGEX = /\A[ァ-ヶ一]+\z/.freeze
  validates_format_of :first_name_katakana, :family_name_katakana, with: PASSWORD_REGEX, message: '全角カタカナを使用してください'
end
