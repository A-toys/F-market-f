# DB設計

# usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false,unique: true|
|email|string|null: false,unique: true|
|password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birthday_year|integer|null: false|
|birthday_month|integer|null: false|
|birthday_date|integer|null: false|
|phone_number|integer|null: false,unique: true|
|icon|text||
|introduce|text|limit: 10000|

### Association
- has_many :items
- has_many :comments
- has_many :orders
- has_one :card
- has_one :address

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|text|text|limit: 10000|
|fee_burden|integer|null: false|
|service|integer|null: false|
|area|integer|null: false|
|handing_time|integer|null: false|
|price|integer|null: false|
|trading_status|integer|null: false|
|seller_user_id|references|null: false, foreign_key: true|
|category|integer|null: false|
|brand|string||

### Association
- has_many :comments
- has_many :images
- belongs_to :user
- has_one :order


## imageテーブル

|Column|Type|Options|
|------|----|-------|
|image_url|string|null: false|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item


## commentテーブル

|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
### Association
- belongs_to :item
- belongs_to :user


## ordersテーブル

|Column|Type|Options|
|------|----|-------|
|buyer_user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## Cardテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|
### Association
- belongs_to user

## Addressテーブル
|Column|Type|Options|
|------|----|-------|
|zip_code|integer|null: false|
|prefecture|string|null: false|
|city|integer|null: false|
|block|string|null: false|
|building|string||
|phone_number|integer||
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to user
