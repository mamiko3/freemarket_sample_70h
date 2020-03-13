class AddUserIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :user_id, :integer
    add_column :items, :null, :false,
    add_column :items, :foreign_key, :true
  end
end