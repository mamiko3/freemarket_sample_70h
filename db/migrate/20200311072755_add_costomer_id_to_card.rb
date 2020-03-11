class AddCostomerIdToCard < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :customer_id, :integer, null: false
  end
end
