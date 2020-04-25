class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string     :postal_code, null: false
      t.string     :prefecture,  null: false
      t.string     :city,        null: false
      t.string     :street,      null: false
      t.string     :apartment
      t.string     :phone_number
      t.references :user,        foreign_key: true
      t.timestamps
    end
  end
end
