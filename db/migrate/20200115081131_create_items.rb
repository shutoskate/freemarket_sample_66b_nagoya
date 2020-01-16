class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string     :name,        null: false, index:true
      t.integer    :size,        null: false
      t.integer    :price,       null: false
      t.references :seller,      null: false, foreign_key:{ to_table: :users }
      t.references :brand,       foreign_key: true
      t.references :category,    null: false, foreign_key: true
      t.integer    :status,      null: false
      t.integer    :charge,      null: false
      t.integer    :trade_step,  null: false, index: true
      t.integer    :delivery,    null: false
      t.integer    :prefecture,  null: false, index: true
      t.integer    :term,        null: false


      t.timestamps
    end
  end
end