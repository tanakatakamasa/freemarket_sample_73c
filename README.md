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
### Association
belongs_to :addresses #スペルミス直した by Kensho
belongs_to :cards
has_many :products

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code||
|prefecture||
|city||
|town||
|street_building||
|phone_number||
### Association
belongs_to :user

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number||
|security_code||
|expiration_year||
|expiration_month||
|users_id|reference|null: false, foreign_key: true|
### Association
belongs_to :user

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|||
|price||
|discription||
|condition||
|delivery_charge||
|original_shipping_address||
|duration||
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
|product_image||
|products_id|reference|null: false, foreign_key: true|
### Association
belongs_to :product

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name||
### Association
has_many :products
