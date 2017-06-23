class AddFranchiseIdOwnerIdToSalons < ActiveRecord::Migration[5.0]
  def change
    add_column :salons, :franchise_id, :integer
    add_column :salons, :owner_id, :integer
  end
end
