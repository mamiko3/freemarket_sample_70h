class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nickname, null: false
      t.string :email, null: false, unique: true
      t.string :password, null: false
      t.string :image
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :first_name_kana, null: false
      t.string :last_name_kana, null: false
      t.integer :phone_number, null: false, unique: true
      t.string :year_birth_at, null: false
      t.string :month_birth_at, null: false
      t.string :day_birth_at, null: false

      t.timestamps
    end
  end
end
