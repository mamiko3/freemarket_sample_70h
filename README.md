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


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|explain|text|null: false|
|postage|integer|null: false|
|region|string|null: false|
|condition|string|null: false|
|shipping|string|null: false|
|size_id|integer|foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
|buyer_id|integer|foreign_key: true|
|brand_id|integer|foreign_key: true|


### Association
- has_many :images, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- belongs_to :category
- belongs_to :user
- belongs_to :purchase
- belongs_to :size
- belongs_to :brand


## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|

### Association
- has_many :items
- has_many :sizes
- has_ancestry


## sizesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string||
|category_id|integer|foreign_key: true|

### Association
- belongs_to :category


## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|
|category_id|integer|foreign_key: true|

### Association
- belongs_to :category


## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|text|string|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|image|string|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|phone_number|integer|null: false, unique: true|
|year_birth_at|string|null: false|
|month_birth_at|string|null: false|
|day_birth_at|string|null: false|

### Association
- has_many :items, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :purchases, dependent: :destroy
- has_many :addresses, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :cards, dependent: :destroy

## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|card_id|string|----|
|customer_id|string|---|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user


## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|zip|integer|null: false|
|pref|string|null: false|
|city|string|null: false|
|block|integer|null: false|
|building|string|
|user_id|integer|null: false, foreign_key: true|
|dst_first_name|string|null: false|
|dst_last_name|string|null: false|
|dst_first_name_kana|string|null: false|
|dst_last_name_kana|string|null: false|

### Association
- belongs_to :user

## purchasesテーブル

|Column|Type|Options|
|------|----|-------|
|bought_date|integer|
|item_id|integer|null: false, foreign_key: true|
|buyer_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item