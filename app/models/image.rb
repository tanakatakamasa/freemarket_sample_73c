class Image < ApplicationRecord
  belongs_to :item

  validates :item_image, presence: true
end
