class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :item_purchases_id, foreign_key: true
      t.string :post_code, null: false
      t.integer :prefecture_code_id, null: false
      t.string :city, null: false
      t.string :house_number, null: false
      t.string :buildng_number
      t.string :phone_number, null: false
      t.timestamps
    end
  end
end
