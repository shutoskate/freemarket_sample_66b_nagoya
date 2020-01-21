class RemoveColumnsFromUsers < ActiveRecord::Migration[5.0]
  def up
    remove_column :users, :birth_year
    remove_column :users, :birth_month
    remove_column :users, :birth_day
  end

  def down
    add_column :users, :birth_year, :integer, null: false
    add_column :users, :birth_year, :integer, null: false
    add_column :users, :birth_year, :integer, null: false
  end
end
