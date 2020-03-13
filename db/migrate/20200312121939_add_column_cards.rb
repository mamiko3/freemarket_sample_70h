class AddColumnCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :card_id, :string
    add_column :cards, :customer_id, :string
    add_column :cards, :user_id, :integer
  end
end
