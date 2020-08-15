class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :address_first_name, null: false
      t.string :address_family_name, null: false
      t.string :address_first_name_kana, null: false
      t.string :address_family_name_kana, null: false
      t.string :post_code, null: false
      t.string :prefecture, null: false
      t.string :city, null: false
      t.string :street_number, null: false
      t.string :house_name
      t.string :phone_number, null: false
      t.references :user, foreign_key:true
      t.timestamps
    end
  end
end
