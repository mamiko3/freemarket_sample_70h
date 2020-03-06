class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :explain, null: false
      t.integer :postage, null: false
      t.string :region, null: false
      t.string :condition, null: false
      t.string :shipping, null: false
      
      t.timestamps
    end
  end
end
