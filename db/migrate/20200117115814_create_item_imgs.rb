class CreateItemImgs < ActiveRecord::Migration[5.0]
  def change
    create_table :item_imgs do |t|
      t.string :img
      t.integer :item_id,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
