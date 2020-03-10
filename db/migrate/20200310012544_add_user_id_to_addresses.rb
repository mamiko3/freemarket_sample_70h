class AddUserIdToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :user_id, :integer, null: false, unique: true
  end
end
