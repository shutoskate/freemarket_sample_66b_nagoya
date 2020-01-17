class AddItemTextToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :item_text, :text
  end
end
