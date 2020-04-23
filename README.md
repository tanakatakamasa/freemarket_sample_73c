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
<img width="785" alt="DB設計　ER図" src="https://user-images.githubusercontent.com/62594253/80076883-bb704e00-8587-11ea-9197-508969c73267.png">

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
belongs_to :address 
belongs_to :card
has_many :products

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|street|string|null:false|
|apartment|string||
|phone_number|string||
|user_id|references|foreign_key: true|
### Association
belongs_to :user

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|string|null: false|
|security_code|string|null: false|
|expiration_year|string|null: false|
|expiration_month|string|null: false|
|users_id|references|foreign_key: true|
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
|users_id|references|foreign_key: true|
|images_id|references|foreign_key: true|
|categories_id|references|foreign_key: true|
### Association
belongs_to :user
belongs_to :category
has_many :images

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|product_image|text|null: false|
|products_id|references|foreign_key: true|
### Association
belongs_to :product

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|products_id|references|foreign_key: true|
### Association
has_many :products
