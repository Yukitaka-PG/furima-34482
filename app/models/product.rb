class Product < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :product_category
  belongs_to :product_status
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :days

  with_options presence: true do
    validates :title
    validates :text
    validates :product_category_id, numericality: { other_than: 1 } 
    validates :product_status_id, numericality: { other_than: 1 } 
    validates :burden_id, numericality: { other_than: 1 } 
    validates :prefecture_id, numericality: { other_than: 1 } 
    validates :days_id, numericality: { other_than: 1 } 
    validates :price, format: { with: /\A[a-zA-Z0-9]+\z/, message: "半角英数を使用してください"}
    validates :user
  end

  # with_options presence: true do
  #   validates :nickname
  #   validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "全角文字を使用してください"}
  #   validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "全角文字を使用してください"}
  #   validates :first_name_katakana, format: { with: /\A[ァ-ヶ一]+\z/, message: "全角カタカナを使用してください"}
  #   validates :family_name_katakana, format: { with: /\A[ァ-ヶ一]+\z/, message: "全角カタカナを使用してください"}
  #   validates :birthday

  #   PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  #   validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  # end
end
