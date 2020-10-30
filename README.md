# テーブル設計

## users テーブル

| Column             | Type          | Options               |
| ------------------ | ------------- | --------------------- |
| nick_name          | string        | null: false           |
| email              | string        | null: false, unique: true|
| encrypted_password | string        | null: false           |
| first_name         | string        | null: false           |
| last_name          | string        | null: false           |
| first_name_kana    | string        | null: false           |
| last_name_kana     | string        | null: false           |
| birth_date         | date          | null: false           |

### Association
 - has_many :products
 - has_many :purchase

## products テーブル

| Column             | Type           | Options              |
| ------------------ | -------------- | -------------------- |
| title              | string         | null: false          |
| price              | integer        | null: false          |
| text               | text           | null: false          |
| category_id        | integer        | null: false          |
| condition_id       | integer        | null: false          |
| prefecture_id      | integer        | null: false          |
| postage_payer_id   | integer        | null: false          |
| preparation_day_id | integer        | null: false          |
| user               | references     | null: false, foreign_key: true |

### Association
 - belongs_to :user
 - has_one :purchase

## purchase テーブル

| Column          | Type            | Options                |
| --------------- | --------------- | ---------------------- |
| product        | references      | null: false, foreign_key: true |
| user           | references      | null: false, foreign_key: true |

### Association
 - belongs_to :user
 - belongs_to :product
 - has_one :address

## address テーブル

| Column          | Type            | Options                |
| --------------- | --------------- | ---------------------- |
| post_code       | string          | null: false            |
| prefecture_id   | integer         | null: false            |
| city            | string          | null: false            |
| address         | string          | null: false            |
| building        | string          |
| phone_number    | string          | null: false            |
| purchase        | references      | null: false, foreign_key: true |

### Association
 - belongs_to :purchase