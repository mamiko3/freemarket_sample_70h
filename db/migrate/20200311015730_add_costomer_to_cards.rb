class AddCostomerToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :costomer_id, :integer, null: false
    add_column :cards, :card_id, :integer, null: false
  end
end
