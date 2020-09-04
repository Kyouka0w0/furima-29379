class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name
      t.string :introduction
      t.integer :price
      t.string :item_imgs

      t.timestamps
    end
  end
end
