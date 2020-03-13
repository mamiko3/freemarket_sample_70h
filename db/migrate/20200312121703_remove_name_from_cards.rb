class RemoveNameFromCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :cards, :name, :string
  end
end
