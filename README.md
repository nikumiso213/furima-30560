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
- has_many : buyers
- has_many : sipping_address

## itemsテーブル

| Column              | Type      | Options           |
| ------------------- | --------- | ----------------- |
| name                | string    | null: false       |
| description_of_item | text      | null: false       |
| category            | string    | null: false       |
| product_status      | string    | null: false       |
| delivery            | string    | null: false       |
| area                | string    | null: false       |
| shipping_days       | string    | null: false       |
| price               | string    | null: false       |
| user                | reference | foreign_key: true |

### Association

- belongs_to : users
- has_many   : buyer
- has_many   : sipping_address

## buyersテーブル

| Column           | Type      | Options           |
| ---------------- | --------- | ----------------- |


### Association

- belongs_to : users
- belongs_to : items
- has_one    : sipping_address

## sipping_addressテーブル

| Column         | Type      | Options           |
| -------------- | --------- | ----------------- |
| postal_code    | string    | null: false       |
| prefectures    | string    | null: false       |
| municipalities | string    | null: false       |
| address        | string    | null: false       |
| building_name  | string    | null: false       |
| phone_number   | string    | null: false       |


### Association

-belongs_to : users
-belongs_to : items
-belongs_to : buyers
