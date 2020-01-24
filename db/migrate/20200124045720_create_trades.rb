class CreateTrades < ActiveRecord::Migration[5.0]
  def change
    create_table :trades do |t|
      t.references  :buyer,  null: false, foreign_key:{ to_table: :users}
      t.references  :item,  foreign_key:true, null: false
      t.integer     :status, null:false
      t.integer     :rating, null:false
      t.timestamps
    end
  end
end
