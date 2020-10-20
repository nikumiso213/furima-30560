# テーブル設計

## usersテーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| nick_name     | string | null: false |
| email         | string | null: false |
| password      | string | null: false |
| name          | string | null: false |
| name_kana     | string | null: false |
| date_of_birth | date   | null: false |

### Association

- has_many : items
- has_many : buyers
- has_many : sipping_address

## itemsテーブル

| Column              | Type      | Options           |
| ------------------- | --------- | ----------------- |
| product_name        | string    | null: false       |
| description_of_item | text      | null: false       |
| category            | string    | null: false       |
| product_status      | string    | null: false       |
| delivery            | string    | null: false       |
| area                | string    | null: false       |
| shipping_days       | integer   | null: false       |
| price               | integer   | null: false       |
| seller              | string    | null: false       |
| user                | reference | foreign_key: true |

### Association

- belongs_to : users
- has_many   : buyer
- has_many   : sipping_address

## buyersテーブル

| Column           | Type      | Options           |
| ---------------- | --------- | ----------------- |
| card_information | integer   | null: false       |
| expiration_date  | date      | null: false       |
| security_code    | integer   | null: false       |
| user             | reference | foreign_key: true |
| item             | reference | foreign_key: true |
| sipping_address  | reference | foreign_key: true |

### Association

- belongs_to : users
- belongs_to : items
- has_one    : sipping_address

## sipping_addressテーブル

| Column         | Type      | Options           |
| -------------- | --------- | ----------------- |
| postal_code    | integer   | null: false       |
| prefectures    | string    | null: false       |
| municipalities | string    | null: false       |
| address        | string    | null: false       |
| building_name  | string    | null: false       |
| phone_number   | integer   | null: false       |
| user           | reference | foreign_key: true |
| item           | reference | foreign_key: true |
| buyer          | reference | foreign_key: true |

### Association

-belongs_to : users
-belongs_to : items
-has_one    : buyers
