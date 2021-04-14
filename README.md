# README

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| birth_day          | string | null: false |



### Association

- has_many : products
- has_one : card
- has_one : destination

## destination テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| famity_name        | string | null: false |
| first_name         | string | null: false |
| famity_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| post_code          | string | null: false |
| prefecture         | string | null: false |
| city               | string | null: false |
| address            | string | null: false |
| build_name         | string | null: false |
| phone_numbeer      | string | null: false |


### Association

- belongs_to : user
- belongs_to : card
- belong_to : destination



## card テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| customer   | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |


### Association

- belong_to : user
- belong_to : customer


## Product テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| name        | string     | null: false |
| price       | string     | null: false |
| description | string     | null: false |
| status      | string     | null: false |
| size        | string     | null: false |
| cost        | string     | null: false |
| day         | string     | null: false |

### Association

- belong_to : user
- belong_to : category
- has_many : images
- has_many : brand

## brand テーブル

| Column      | Type       | Options        |
| ----------- | ---------- | -------------- |
| name        | string     | null: false    |

### Association

- belong_to : product

## images テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| images        | text       | null: false                    |
| text          | text       | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belong_to : product


## category テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | text       | null: false                    |
| ancestry      | text       | null: false                    |

### Association

- belong_to : product
