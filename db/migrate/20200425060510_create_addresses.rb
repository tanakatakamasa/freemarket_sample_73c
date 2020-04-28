class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string     :last_name,       null: false
      t.string     :last_name_kana,  null: false
      t.string     :first_name,      null: false
      t.string     :first_name_kana, null: false
      t.string     :postal_code,     null: false
      t.integer    :prefecture_id,   null: false
      t.string     :city,            null: false
      t.string     :street,          null: false
      t.string     :apartment
      t.string     :phone_number
      t.references :user,            foreign_key: true, null: false
      t.timestamps
    end
  end
end
