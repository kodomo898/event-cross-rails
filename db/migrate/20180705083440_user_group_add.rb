class UserGroupAdd < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_group, :string
  end
end
