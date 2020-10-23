# テーブル設計

## usersテーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nick_name        | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| date_of_birth    | date   | null: false |

### Association

- has_many : items
- has_many : orders

## itemsテーブル

| Column            | Type      | Options           |
| ----------------- | --------- | ----------------- |
| name              | string    | null: false       |
| description       | text      | null: false       |
| category_id       | integer   | null: false       |
| product_status_id | integer   | null: false       |
| delivery_id       | integer   | null: false       |
| area_id           | integer   | null: false       |
| shipping_days_id  | integer   | null: false       |
| price             | integer   | null: false       |
| user              | reference | foreign_key: true |

### Association

- belongs_to : user
- has_many   : orders
- has_many   : shipping_addresses

## ordersテーブル

| Column  | Type    | Options     |
| ------- | ------- | ----------- |
| user_id | integer | null: false |
| item_id | integer | null: false |

### Association

- belongs_to : user
- belongs_to : item
- has_one    : shipping_address

## shipping_addressesテーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| postal_code    | string  | null: false |
| prefectures    | integer | null: false |
| municipalities | string  | null: false |
| address        | string  | null: false |
| building_name  | string  |             |
| phone_number   | string  | null: false |


### Association

-belongs_to : order
