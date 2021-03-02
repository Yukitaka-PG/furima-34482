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
| birthday             | date   | null: false               |

### Association

- has_many :products
- has_many :cards

## destinations(配送先情報)

| Column        | Type       | Options                        |
|---------------|----------- |--------------------------------|
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| house_name    | string     |                                |
| phone_number  | string     | null: false                    |
| card          | references | null: false, foreign_key: true |

### Association

- belong_to :card

## Products（商品情報）

| Column              | Type       | Options                        |
|---------------------|----------- |------------------------------- |
| title               | string     | null: false                    |
| text                | text       | null: false                    |
| product_category_id | integer    | null: false                    |
| product_status_id   | integer    | null: false                    |
| burden_id           | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| days_id             | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :card


## cards(購入記録)

| Column      | Type       | Options                         |
|-------------|------------|---------------------------------|
| user        | references | null: false, foreign_key: true  |
| product     | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :product
- has_one :destination
