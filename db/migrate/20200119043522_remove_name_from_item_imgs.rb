class RemoveNameFromItemImgs < ActiveRecord::Migration[5.0]
  def change
    remove_column :item_imgs, :item_id, :integer
    add_reference :item_imgs, :item, foreign_key: true
  end
end
