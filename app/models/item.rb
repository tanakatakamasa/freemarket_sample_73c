class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :condition
  belongs_to_active_hash :burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :duration

  belongs_to :buyer, class_name: 'User', optional: true
  belongs_to :seller, class_name: 'User'
  belongs_to :category, optional: true

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  # 画像がないと投稿できないようにするバリデーション
  validates_presence_of :images 

  # helperオプションは出品機能が最低限完了し次第、付与。
  # 今はチームメンバーから一部引き継いでいる状態なので、要相談、一旦バリデーションはコメントアウトする
  with_options presence: true do
    validates :name
    validates :price
    validates :discription
    validates :category_id
    validates :condition_id
    validates :burden_id
    validates :prefecture_id
    validates :duration_id
  end

  # showアクションのビューで前の商品を呼び出すメソッド
  def previous
    Item.where("id < ?", self.id).order("id DESC").first
  end
 
  # showアクションのビューで後ろの商品を呼び出すメソッド
  def next
    Item.where("id > ?", self.id).order("id ASC").first
  end
end
