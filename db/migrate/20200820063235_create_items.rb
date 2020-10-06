class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :detail, null: false
      t.references :category, null:false, foreign_key:true
      t.string :brand
      t.integer :condition, null: false
      t.integer :postage, null: false
      t.integer :area, null: false
      t.integer :until_shipping, null: false
      t.integer :price, null: false
      t.integer :stock
      t.references :seller
      t.references :buyer
      t.timestamps
    end
    add_foreign_key :items, :users, column: :seller_id
    add_foreign_key :items, :users, column: :buyer_id
  end
end
