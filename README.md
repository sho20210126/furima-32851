# README

# テーブル設計

## purchase_managements テーブル

| Column             | Type       | Options                        |
| ------------------ | ------     | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| product            | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- belongs_to : product
- belongs_to : destinations


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

- has_many : products
- has_many : purchase_management

## destinations テーブル

| Column              | Type       | Options                        |
| ------------------  | ---------- | ----------------------------   |
| post_code           | string     | null: false                    |
| prefecture_id       | integer    | null: false                    |
| municipality        | string     | null: false                    |
| address             | string     | null: false                    |
| build_name          | string     |                                |
| phone_number        | string     | null: false                    |
| purchase_management | references | null: false, foreign_key: true |


### Association

- belongs_to : user


## products テーブル

| Column               | Type       | Options                        |
| -------------------  | ---------- | -----------------------        |
| product_name         | string     | null: false                    |
| product_description  | text       | null: false                    |
| product_price        | integer    | null: false                    |
| product_status_id    | integer    | null: false                    |
| delivery_cost_id     | integer    | null: false                    |
| product_area_id      | integer    | null: false                    |
| delivery_day_id      | integer    | null: false                    |
| delivery_category_id | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association

- has_one : purchase_management



