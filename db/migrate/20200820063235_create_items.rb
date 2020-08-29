class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :detail, null: false
      t.integer :price, null: false
      t.string :condition, null: false
      t.integer :postage, null: false
      t.string :brand
      t.string :stock
      t.references :category, null:false, foreign_key:true
      t.references :buyer, null:false, foreign_key: { to_table: :users }
      t.references :seller, null:false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
