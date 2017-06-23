class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, :precision => 11, :scale => 2
      t.string :description
      t.integer :type
      t.integer :salon_id

      t.timestamps
    end
  end
end
