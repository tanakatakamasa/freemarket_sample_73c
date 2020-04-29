class Card < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :customer_id
    validates :card_id
  end
end
