class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, password_length: 7..128

  has_one :address, dependent: :destroy
  has_one :card, dependent: :destroy
  has_many :buyer_items, :foreign_key => 'buyer_id', class_name: 'Items'
  has_many :seller_items, :foreign_key => 'seller_id', class_name: 'Items'

  validates :email, presence: true, uniqueness: true

  with_options presence: true do
    validates :nickname
    validates :encrypted_password
    validates :birthday
    validates :last_name
    validates :last_name_kana
    validates :first_name
    validates :first_name_kana
  end
end
