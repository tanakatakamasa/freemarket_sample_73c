class Item < ApplicationRecord
  has_many :images, dependent: :destroy
  belongs_to :user
  belongs_to :category

  with_options presence: true do
    validates :name
    validates :price
    validates :discription
    validates :condition
    validates :delivery_charge
    validates :original_shipping_address
    validates :duration
  end
end
