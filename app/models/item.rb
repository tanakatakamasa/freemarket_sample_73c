class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  has_many :images, dependent: :destroy
  belongs_to :user
  belongs_to :category

  with_options presence: true do
    validates :name
    validates :price
    validates :discription
    validates :condition
    validates :delivery_charge
    validates :prefecture_id
    validates :duration
  end
end
