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
