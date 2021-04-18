# README

# テーブル設計

## purchase_management テーブル

| Column             | Type       | Options                        |
| ------------------ | ------     | ------------------------------ |
| user_id            | references | null: false, foreign_key: true |
| product_id         | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- belongs_to : product

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
- has_one : purchase_management

## destination テーブル

| Column              | Type       | Options                        |
| ------------------  | ---------- | ----------------------------   |
| post_code           | string     | null: false                    |
| prefecture          | string     | null: false                    |
| municipality        | string     | null: false                    |
| address             | string     | null: false                    |
| build_name          | string     | null: false                    |
| phone_number        | string     | null: false                    |
| purchase_management | references | null: false, foreign_key: true |


### Association

- belongs_to : user
- belong_to : destination


## product テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | -----------                    |
| product_name        | string     | null: false                    |
| product_description | text       | null: false                    |
| product_price       | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belong_to : purchase_management



