class Card < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :card_number
    validates :security_code
    validates :expiration_year
    validates :expiration_month
  end
end
