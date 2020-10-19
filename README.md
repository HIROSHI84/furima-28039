# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



# テーブル設計

## users テーブル
| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| first_name      | string  | null: false |
| last_name       | string  | null: false |
| first_name_kana | string  | null: false |
| last_name_kana  | string  | null: false |
| birth_day       | date    | null: false |

### Association
- has_many :items
- has_many :comments dependent: :destroy
- has_many :favorites dependent: :destroy
- has_many :purchases 



## items テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false ,foreign_key: true |
| name             | string     | null: false                    |
| price            | integer    | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| postage_payer_id | integer    | null: false                    |
| shipping_area_id | integer    | null: false                    |
| shipping_date_id | integer    | null: false                    |

### Association
- belongs_to :user
- belongs_to_active_hash :category
- belongs_to_active_hash :condetion
- belongs_to_active_hash :postage_payer
- belongs_to_active_hash :shipping_area
- belongs_to_active_hash :shipping_date
- has_one_attached :item_images
- has_one :purchases 



## comments テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| comment  | text       | null: false                    |
| user     | references | null: false ,foreign_key: true |
| item     | references | null: false ,foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item



## favorites テーブル
| Column   | Type       | Options                         |
| -------- | ---------- | ------------------------------- |
| user     | references | null: false , foreign_key: true |
| item     | references | null: false , foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item



## purchases テーブル

| Column      | Type       | Options                         |
| ----------- | ---------- | ------------------------------- |
| user        | references | null: false , foreign_key: true |
| item        | references | null: false , foreign_key: true |

### Association
- has_one :delivery_address
- belongs_to :user
- belongs_to :item



## delivery_addresses テーブル

| Column           | Type       | Options                         |
| ---------------  | ---------- | ------------------------------- |
| postal_code      | string     | null:false                      |
| shipping_area_id | integer    | null:false                      |
| municipality     | string     | null:false                      |
| house_number     | string     | null:false                      |  
| building_name    | string     |                                 |
| phone_number     | string     | null:false                      |
| purchase         | references | null: false , foreign_key: true |

### Association
- belongs_to :purchase

