class Product < ApplicationRecord
  has_one_attached :image
  belongs_to :user

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
    validates :product_category_id, numericality: { other_than: 1 } 
    validates :product_status_id, numericality: { other_than: 1 } 
    validates :burden_id, numericality: { other_than: 1 } 
    validates :prefecture_id
    validates :days_id, numericality: { other_than: 1 } 
    validates :price, format: { with: /\A[a-zA-Z0-9]+\z/, message: "半角英数を使用してください"}
    validates :user
  end
end
