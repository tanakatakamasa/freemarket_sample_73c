class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string     :card_number,      null: false
      t.string     :security_code,    null: false
      t.string     :expiration_year,  null: false
      t.string     :expiration_month, null: false
      t.references :user,             foreign_key: true
      t.timestamps
    end
  end
end
