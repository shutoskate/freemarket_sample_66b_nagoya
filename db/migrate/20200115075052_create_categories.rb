class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string   :name,       index: true
      t.integer  :parent_id,  forelign_key: true


      t.timestamps
    end
  end
end
