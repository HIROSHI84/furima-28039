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
- has_one : delivery_address dependent: :destroy
- has_one : credit_card dependent: :destroy



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
- belong_to :user
- belong_to :category
- belong_to :brand
- belong_to_active_hash :condetion
- belong_to_active_hash :postage_payer
- belong_to_active_hash :shipping_area
- belong_to_active_hash :shipping_date
- has_many :item_images



## comments テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| comment  | text       | null: false                    |
| user     | references | null: false ,foreign_key: true |
| item     | references | null: false ,foreign_key: true |

### Association
- belong_to :user
- belong_to :item



## favorites テーブル
| Column   | Type       | Options                         |
| -------- | ---------- | ------------------------------- |
| user     | references | null: false , foreign_key: true |
| item     | references | null: false , foreign_key: true |

### Association
- belong_to :user
- belong_to :item



## purchases テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| user        | string     | null: false |
| item        | string     | null: false |

### Association
- has_one :delivery_address



## delivery_addresses テーブル

| Column          | Type       | Options                         |
| --------------- | ---------- | ------------------------------- |
| postal_code     | string     | null:false                      |
| prefectures_code| integer    | null:false                      |
| municipality    | string     | null:false                      |
| house_number    | string     | null:false                      |  
| building_name   | string     |                                 |
| phone_number    | string     | null:false                      |
| purchase_id     | references | null: false , foreign_key: true |

### Association
- belong_to :purchase

