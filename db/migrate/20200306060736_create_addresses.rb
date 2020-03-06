class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :zip, null: false
      t.string :pref, null: false
      t.string :city, null: false
      t.integer :block, null: false
      t.string :building
      t.string :dst_first_name, null: false
      t.string :dst_last_name, null: false
      t.string :dst_first_name_kana, null: false
      t.string :dst_last_name_kana, null: false
      
      t.timestamps
    end
  end
end
