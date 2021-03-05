class DestinationCard
  include ActiveModel::Model
  attr_accessor :user, :product, :postal_code, :prefecture_id, :city, :address, :house_name, :phone_number

  with_options presence: true do
    validates :user
    validates :product
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :address
    validates :house_name
    validates :phone_number, format: {with: 0\d{9,10}, message: "半角数字で入力してください"}
  end
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
  
  def save
    card = card.create(user: user, product: product)
    Destination.create(postal_code: postal_code, city: city, address: address, house_name: house_name, phone_number: phone_number, card_id: card_id)
  end
end