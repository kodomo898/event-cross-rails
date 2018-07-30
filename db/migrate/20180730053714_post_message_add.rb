class PostMessageAdd < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :message, :string
  end
end
