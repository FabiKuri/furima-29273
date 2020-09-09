## usersテーブル

| column              | type   | options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| password            | string | null: false |
| family-name         | string | null: false |
| first-name          | string | null: false |
| family-name-reading | string | null: false |
| first-name-reading  | string | null: false |
| birthday            | date   | null: false |


### Association

- has_many :items
- has_many :buyers


## itemsテーブル


| column                 | type    | options                        |
| ---------------------- | ------- | ------------------------------ |
| name                   | string  | null: false                    |
| content                | text    | null: false                    |
| genre_id               | integer | null: false                    |
| item-detail_id         | integer | null: false                    |
| shipping-detail_id     | integer | null: false                    |
| shipping-prefecture_id | integer | null: false                    |
| shipping-day           | integer | null: false                    |
| price                  | integer | null: false                    |
| user_id                | integer | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :buyer


## buyers テーブル

| column           | type       | options                  |
| ---------------- | ---------- | ------------------------ |
| user_id          | integer    | null: false, foreign_key |
| item_id          | integer    | null: false, foreign_key |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## Addressesテーブル

| column          | type    | options                        |
| --------------- | ------- |------------------------------- |
| postal-code     | string  | null: false                    | 
| prefecture_id   | integer | null: false                    | 
| city            | string  | null: false                    | 
| house-number    | string  | null: false                    | 
| building-number | string  |                                | 
| phone-number    | string  | null: false                    |
| buyer_id        | integer | null: false, foreign_key: true |

### Association

- belongs_to :buyer


