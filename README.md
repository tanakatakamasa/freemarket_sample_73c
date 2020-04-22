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

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|password|string|null: false|
|e-mail_address|string|null: false|
|nickname|string|null: false|
|last_name|string|null: false|
|last_name_kana|string|null: false|
|first_name|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|

### Association
belongs_to :addresses #スペルミス直した by Kensho
belongs_to :cards
has_many :products

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|town|string|null: false|
|street_building|string||
|phone_number|string||
|user_id|reference|null: false, foreign_key: true|
### Association
belongs_to :user

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false|
|security_code|integer|null: false|
|expiration_year|integer|null: false|
|expiration_month|integer|null: false|
|users_id|reference|null: false, foreign_key: true|
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
|users_id|reference|null: false, foreign_key: true|
|images_id|reference|null: false, foreign_key: true|
|categories_id|reference|null: false, foreign_key: true|
### Association
belongs_to :user
belongs_to :category
has_many :images

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|product_image|text|null: false|
|products_id|reference|null: false, foreign_key: true|
### Association
belongs_to :product

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|products_id|reference|null: false|
### Association
has_many :products
