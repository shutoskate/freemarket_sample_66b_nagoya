class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table    :addresses do |t|
      t.references  :user,          foreign_key:true
      t.string      :post_code,     null: false
      t.integer     :prefecture,    null: false
      t.string      :city,          null: false
      t.string      :address,       null: false
      t.string      :building
      t.boolean     :master,        null: false, default: true
      t.timestamps
    end
  end
end
