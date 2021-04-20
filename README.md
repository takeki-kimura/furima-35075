# テーブル設計

## users テーブル

| Column             | Type   | Options                       |
|--------------------|--------|-------------------------------|
| nickname           | string | null: false                   |
| email              | string | null: false, foreign_key: true|
| encrypted_password | string | null: false                   |
| first_name         | string | null: false                   |
| family_name        | string | null: false                   |
| first_name_kana    | string | null: false                   |
| family_name_kana   | string | null: false                   |
| birth              | date   | null: false                   |

Association
 has_many :products
 has_many :orders


## products テーブル

| Column         | Type      | Options                        |
|----------------|-----------|--------------------------------|
| name           | string    | null: false                    |
| category_id    | integer   | null: false                    |
| price          | integer   | null: false                    |
| user           | reference | null: false, foreign_key: true |
| status_id      | integer   | null: false                    |
| fee_id         | integer   | null: false                    |
| prefectures_id | integer   | null: false                    |
| day_id         | integer   | null: false                    |
| description    | text      | null: false                    |

Association
 belongs_to :user
 has_one    :order

## orders テーブル

| Column       | Type    | Options                       |
|--------------|---------|-------------------------------|
|product_id    | integer |null: false, foreign_key: true |
|user_id       | integer |null: false, foreign_key: true |

Association
 belongs_to :user
 belongs_to :product
 has_one    :address

## addresses テーブル

| Column         | Type    | Options                        |
|----------------|---------|--------------------------------|
| postal_code    | string  | null:false                     |
| prefectures_id | integer | null: false                    |
| city           | string  | null: false                    |
| number         | string  | null: false                    |
| building_name  | string  |                                |
| phone_number   | string  | null: false                    |
| orders_id      | integer | null: false, foreign_key: true |

Association
 belongs_to :order

