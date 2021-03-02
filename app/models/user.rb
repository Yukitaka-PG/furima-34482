class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products

  with_options presence: true do
    validates :nickname
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "全角文字を使用してください"}
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "全角文字を使用してください"}
    validates :first_name_katakana, format: { with: /\A[ァ-ヶ一]+\z/, message: "全角カタカナを使用してください"}
    validates :family_name_katakana, format: { with: /\A[ァ-ヶ一]+\z/, message: "全角カタカナを使用してください"}
    validates :birthday

    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  end
end