#DB設計

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
|address_number|integer|null: false|
|address_prefecture|string|null: false|
|address_name|integer|null: false|
|address_block|string|null: false|
|address_building|string||
|address_phone_number|integer||
|icon|text||
|introduce|text||

### Association
- has_many :items
- has_many :coments
- has_many :orders


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|text|text||
|fee_burden|integer|null: false|
|service|integer|null: false|
|area|integer|null: false|
|handing_time|integer|null: false|
|price|integer|null: false|
|trading_status|integer|null: false|
|seller_user_id|references|null: false, foreign_key: true|
|category|integer|null: false|
|brand|text||
|image_id|references|null: false, foreign_key: true|

### Association
- has_many :coments
- has_many :images
- has_many :belong_to user
- has_one :order




## imageテーブル
|Column|Type|Options|
|------|----|-------|
|iamge_url|text|null: false|
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

buyer_user_id

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

### Association
