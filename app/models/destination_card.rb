class DestinationCard
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :postal_code, :prefecture_id, :city, :address, :house_name, :phone_number

  with_options presence: true do
    validates :user_id
    validates :product_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :address
    validates :house_name
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}
  end
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
  
  def save
    card = Card.create(user_id: user_id, product_id: product_id)
    Destination.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, house_name: house_name, phone_number: phone_number, card_id: card.id)
  end
end