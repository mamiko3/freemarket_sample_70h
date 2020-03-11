class RemoveCostomerIdFromCard < ActiveRecord::Migration[5.2]
  def change
    remove_column :cards, :costomer_id, :integer
  end
end
