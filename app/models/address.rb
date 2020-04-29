class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  belongs_to :user

  with_options presence: true do
    validates :last_name
    validates :last_name_kana
    validates :first_name
    validates :first_name_kana
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :street
  end
end
