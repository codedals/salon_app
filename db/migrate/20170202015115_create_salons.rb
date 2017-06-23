class CreateSalons < ActiveRecord::Migration[5.0]
  def change
    create_table :salons do |t|
      t.string :name
      t.string :main_image_url
      t.string :description
      t.string :location
      t.string :categories, array: true
      t.string :services, array: true
      t.boolean :active
      t.boolean :listed

      t.timestamps
    end
  end
end
