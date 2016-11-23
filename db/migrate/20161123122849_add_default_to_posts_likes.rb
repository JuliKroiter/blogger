class AddDefaultToPostsLikes < ActiveRecord::Migration
  def up
    change_column_default :posts, :likes, 0
  end

  def down
    change_column_default :posts, :likes, :null
  end
end
