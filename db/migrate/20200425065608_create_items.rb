class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string     :name,                      null: false
      t.integer    :price,                     null: false
      t.text       :discription,               null: false
      t.integer    :condition_id,              null: false
      t.integer    :burden_id,                 null: false
      t.integer    :prefecture_id,             null: false
      t.integer    :duration_id,               null: false
      t.references :user,                      foreign_key: true
      t.references :category,                  foreign_key: true
      t.timestamps
    end
  end
end
