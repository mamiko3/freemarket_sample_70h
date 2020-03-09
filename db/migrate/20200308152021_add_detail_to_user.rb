class AddDetailToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :year_birth_at, :string, null: false
    add_column :users, :month_birth_at, :string, null: false
    add_column :users, :day_birth_at, :string, null: false
  end
end
