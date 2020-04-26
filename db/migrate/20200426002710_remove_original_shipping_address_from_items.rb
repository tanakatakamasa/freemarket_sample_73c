class RemoveOriginalShippingAddressFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :original_shipping_address, :string
  end
end
