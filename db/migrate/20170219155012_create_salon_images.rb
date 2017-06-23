class CreateSalonImages < ActiveRecord::Migration[5.0]
  def change
    create_table :salon_images do |t|
      t.string :name
      t.string :image_url
      t.integer :type
      t.integer :salon_id

      t.timestamps
    end
  end
end
