class AddLineItemsToSalons < ActiveRecord::Migration[5.0]
  def change
    add_column :salons, :amenities, :string, array: true
    add_column :salons, :key_product_list, :string, array: true
    add_column :salons, :ambience, :string, array: true
    add_column :salons, :specialities, :string, array: true
    add_column :salons, :payment_options, :string, array: true
  end
end
