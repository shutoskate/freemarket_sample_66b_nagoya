class RemovePhonenumFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :phone_num
  end
end
