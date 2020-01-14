class RemovePhoneNumFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :phone_num, :string
  end
end
