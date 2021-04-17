# README

# テーブル設計

## purchase_management テーブル

| Column             | Type       | Options                        |
| ------------------ | ------     | ------------------------------ |
| user_id            | references | null: false, foreign_key: true |
| product_id         | references | null: false, foreign_key: true |

### Association

- has_many : products
- has_one : card

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| family_name_kana   | string | null: false               |
| birth_day          | date   | null: false               |

### Association

- has_many : destinations
- has_one : 

## destination テーブル

| Column             | Type       | Options                        |
| ------------------ | ------     | ----------------------------   |
| post_code          | string     | null: false                    |
| prefecture         | string     | null: false                    |
| municipality       | string     | null: false                    |
| address            | string     | null: false                    |
| build_name         | string     | null: false                    |
| phone_number       | string     | null: false                    |
| user_id            | references | null: false, foreign_key: true |


### Association

- belongs_to : user
- belongs_to : card
- belong_to : destination


## product テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | -----------                    |
| product_name        | string     | null: false                    |
| product_description | text       | null: false                    |
| product_price       | integer    | null: false                    |
| status_id           | integer    | null: false                    |
| delivery_charge_id  | integer    | null: false                    |
| product_area_id     | integer    | null: false                    |
| delivery_date_id    | integer    | null: false                    |
| category_id         | integer    | null: false                    |
| size_id             | integer    | null: false                    |
| cost_id             | integer    | null: false                    |
| day_id              | integer    | null: false                    |
| user_id             | references | null: false, foreign_key: true |

### Association

- belong_to : user
- belong_to : category
- has_many : images
- has_many : brand


