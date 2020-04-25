class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string     :name,                      null: false
      t.integer    :price,                     null: false
      t.text       :discription,               null: false
      t.string     :condition,                 null: false
      t.string     :delivery_charge,           null: false
      t.string     :original_shipping_address, null: false
      t.string     :duration,                  null: false
      t.references :user,                      foreign_key: true
      t.references :category,                  foreign_key: true
      t.timestamps
    end
  end
end
