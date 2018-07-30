class PostMessageTypeChange < ActiveRecord::Migration[5.0]
  def change
    change_column :posts, :message, :text
  end
end
