class AddFirstNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
	add_column :users, :administrator, :boolean
  end
end
