class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :burden
  belongs_to_active_hash :duration
  has_many :images, dependent: :destroy
  belongs_to :user
  belongs_to :category

  with_options presence: true do
    validates :name
    validates :price
    validates :discription
    validates :condition_id
    validates :delivery_charge
    validates :prefecture_id
    validates :duration
  end
end
