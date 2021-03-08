class Product < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :card

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :product_category
  belongs_to :product_status
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :days

  with_options presence: true do
    validates :image
    validates :title
    validates :text
    validates :price, numericality: {with: /\A[０−９]+\z/, message: "半角数字を使用してください"}
  end

  with_options numericality: { other_than: 1 } do
    validates :product_category_id
    validates :product_status_id
    validates :burden_id
    validates :prefecture_id
    validates :days_id
  end

    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message:"300以上9999999以下で入力してください"}
end
