class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :condition
  belongs_to_active_hash :burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :duration

  belongs_to :buyer, class_name: 'User', :foreign_key => 'buyer_id'
  belongs_to :seller, class_name: 'User', :foreign_key => 'seller_id'
  belongs_to :category

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  with_options presence: true do
    validates :name
    validates :price
    validates :discription
    validates :condition_id
    validates :burden_id
    validates :prefecture_id
    validates :duration_id
  end
end
