## Users

| Column               | Type   | Options                   |
|----------------------|--------|---------------------------|
| nickname             | string | null: false               |
| email                | string | null: false, unique: true |
| encrypted_password   | string | null: false               |
| first_name           | string | null: false               |
| family_name          | string | null: false               |
| first_name_katakana  | string | null: false               |
| family_name_katakana | string | null: false               |
| Birthday             | string | null: false               |

### Association

- has_many :products
- has_many :cards

## destinations(配送先情報)

| Column       | Type       | Options                        |
|--------------|----------- |--------------------------------|
| postal_code  | string     | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| house_name   | string     |                                |
| phone_number | string     | null: false                    |
| user_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :cards

## Products（商品情報）

| Column              | Type       | Options                        |
|---------------------|----------- |------------------------------- |
| title               | string     | null: false                    |
| text                | string     | null: false                    |
| product_category_id | integer    | null: false                    |
| product_status      | string     | null: false                    |
| burden              | string     | null: false                    |
| area                | string     | null: false                    |
| days                | string     | null: false                    |
| price               | string     | null: false                    |
| user_id             | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## cards(購入記録)

| Column      | Type   | Options                         |
|-------------|--------|---------------------------------|
| user_id     | integer | null: false, foreign_key: true |
| customer_id | string  | null: false                    |

### Association

- belongs_to :user
- belongs_to :destination
