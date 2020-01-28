class AddPhonenumToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :phone_num, :string, null: false
  end
end
