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

## ER図
[70b61f76-50a6-4ca5-8843-51c6970194fb copy.pdf](https://github.com/uwkoichi/freemarket_sample_73c/files/4534372/70b61f76-50a6-4ca5-8843-51c6970194fb.copy.pdf)

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|password|string|null: false|
|e-mail_address|string|null: false, unique: true|
|last_name|string|null: false|
|last_name_kana|string|null: false|
|first_name|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|
### Association
has_one :address, dependent: :destroy
has_one :card, dependent: :destroy
has_many :products, dependent: :destroy


## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|street|string|null:false|
|apartment|string||
|phone_number|string||
|user_id|references|null: false, foreign_key: true|
### Association
belongs_to :user

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|string|null: false|
|security_code|string|null: false|
|expiration_year|string|null: false|
|expiration_month|string|null: false|
|user_id|references|null: false, foreign_key: true|
### Association
belongs_to :user

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|discription|text|null: false|
|condition|string|null: false|
|delivery_charge|string|null: false|
|original_shipping_address|string|null: false|
|duration|string|null: false|
|user_id|references|fnull: false, foreign_key: true|
|category_id|references|fnull: false, foreign_key: true|
### Association
belongs_to :user
belongs_to :category
has_many :images, dependent: :destroy

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|product_image|string|null: false|
|product_id|references|null: false, foreign_key: true|
### Association
belongs_to :product

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
has_many :products
