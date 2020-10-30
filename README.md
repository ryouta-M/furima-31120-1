# テーブル設計

## users テーブル

| Column          | Type          | Options               |
| --------------- | ------------- | --------------------- |
| nick_name       | string        | null: false           |
| email           | string        | null: false, unique: true|
| password        | string        | null: false           |
| first_name      | string        | null: false           |
| last_name       | string        | null: false           |
| first_name_kana | string        | null: false           |
| last_name_kana  | string        | null: false           |
| birth_date      | date          | null: false           |

### Association
 - has_many :products
 - has_many :purchase

## products テーブル

| Column          | Type           | Options              |
| --------------- | -------------- | -------------------- |
| title           | string         | null: false          |
| price           | integer        | null: false          |
| text            | text           | null: false          |
| category_id     | integer        | null: false          |
| condition_id    | integer        | null: false          |
| prefecture_id   | integer        | null: false          |
| postage_payer   | integer        | null: false          |
| preparation_day | integer        | null: false          |
| user_id         | references     | null: false, foreign_key: true |

### Association
 - belongs_to :users
 - has_one :purchase

## purchase テーブル

| Column          | Type            | Options                |
| --------------- | --------------- | ---------------------- |
| product_id      | references      | null: false, foreign_key: true |
| user_id         | references      | null: false, foreign_key: true |

### Association
 - belongs_to :users
 - belongs_to :products
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
| purchase_id     | references      | null: false, foreign_key: true |

### Association
 - belongs_to :purchase