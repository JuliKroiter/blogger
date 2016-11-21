class UpdatePostForWeb < ActiveRecord::Migration
  def change
    add_column :posts, :web_id, :string
    add_column :posts, :link, :string
    add_column :posts, :likes, :integer
    add_column :posts, :from, :integer, default: 0
  end
end
