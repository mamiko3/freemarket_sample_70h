class AddNickNameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string, null: false
    # add_column :users, :image
    # add_column :users, :first_name, :string, null: false
    # add_column :users, :last_name, :string, null: false
    # add_column :users, :first_name_kana, :string, null: false
    # add_column :users, :last_name_kana, :string, null: false
    # add_column :users, :phone_number, :integer, null: false, unique: true
    # add_column :users, :year_birth_at, :string, null: false
    # add_column :users, :month_birth_at, :string, null: false
    # add_column :users, :day_birth_at, :string, null: false
  end
end
