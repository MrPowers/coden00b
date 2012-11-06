class RemoveBodyFromPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :body
      end

  def down
    add_column :posts, :body, :text
  end
end
