## Users

| Column               | Type   | Options                   |
|----------------------|--------|---------------------------|
| nickname             | string | null: false, unique: true |
| email                | string | null: false               |
| password             | string | null: false               |
| first_name           | string | null: false               |
| family_name          | string | null: false               |
| first_name_katakana  | string | null: false               |
| family_name_katakana | string | null: false               |

### Association

- has_many :product
- has_one :destination
- has_one :card

## destinations(配送先情報)

| Column       | Type    | Options                        |
|--------------|-------- |--------------------------------|
| postal_code  | string  | null: false                    |
| prefecture   | string  | null: false                    |
| city         | string  | null: false                    |
| address      | string  | null: false                    |
| house_name   | string  | null: false                    |
| phone_number | string  | null: false                    |
| user_id      | integer | null: false, foreign_key: true |

### Association

- belongs_to :user

## Products（商品情報）

| Column           | Type    | Options                        |
|------------------|-------- |--------------------------------|
| title            | string  | null: false                    |
| text             | string  | null: false                    |
| product_category | string  | null: false                    |
| product_status   | string  | null: false                    |
| burden           | string  | null: false                    |
| area             | string  | null: false                    |
| days             | string  | null: false                    |
| price            | string  | null: false                    |
| user_id          | integer | null: false, foreign_key: true |

### Association

- belongs_to :user

## cards(購入記録)

| Column      | Type   | Options                         |
|-------------|--------|---------------------------------|
| user_id     | integer | null: false, foreign_key: true |
| customer_id | string  | null: false                    |

### Association

- belongs_to :user
