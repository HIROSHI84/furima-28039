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
| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| nickname   | string  | null: false |
| email      | string  | null: false |
| password   | string  | null: false |
| last_name  | string  | null: false |
| first_name | string  | null: false |
| birth_day  | date    | null: false |

### Association
- has_many :items
- has_many :comements dependent: :destroy
- has_many :favorites dependent: :destroy
- has_one : delivery_address dependent: :destroy
- has_one : credit_card dependent: :destroy



## items テーブル
| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| name             | string     | null: false |
| price            | integer    | null: false |
| description      | text       | null: false |
| category_id      | references | null: false |
| brand            | references | null: false |
| images_id        | references | null: false |
| condetion_id     | references | null: false |
| postage_payer_id | references | null: false |
| shipping_area_id | references | null: false |
| shipping_date_id | references | null: false |

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
| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| comment          | text       | null: false |
| user             | references | null: false |
| item             | references | null: false |

### Association
- belong_to :user
- belong_to :item



## favorites テーブル
| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| user             | references | null: false |
| item             | references | null: false |

### Association
- belong_to :user
- belong_to :item


## items_images テーブル
| Column    | Type       | Options     |
| ----------| ---------- | ----------- |
| item      | refarenceas| null: false |
| image     | string     | null: false |

### Association
- belongs_to :item



## category テーブル
| Column    | Type       | Options     |
| ----------| ---------- | ----------- |
| name      | string     | null: false |

### Association
- has_many :item



## conditions テーブル
| Column    | Type       | Options     |
| ----------| ---------- | ----------- |
| condetion | string     | null: false |

### Association
- has_many :item



## postage_payer テーブル
| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| postage_payer | string     | null: false |

### Association
- has_many :item


## shipping_area テーブル
| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| shipping_area | string     | null: false |

### Association
- has_many :item



## shipping_date テーブル
| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| shipping_date | string     | null: false |

### Association
- has_many :item


## purchase テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| user            | string     | null: false |
| item            | string     | null: false |

### Association
- belongs_to :user



## delivery_address テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| postal_code     | integer    | null:false  |
| prefectures_code| integer    | null:false  |
| municipality    | string     | null:false  |
| house_number    | string     | null:false  |  
| building_name   | string     | null:false  |
| phone_number    | integer    | null:false  |

### Association
- belongs_to :user



## credit_card テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| card_number     | integer    | null:false  |
| expiration_year | integer    | null:false  |
| expiration_day  | integer    | null:false  |
| security_code   | integer    | null:false  |

### Association
- belongs_to :user
