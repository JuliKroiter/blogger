class AddHashTagToTopicAndCategory < ActiveRecord::Migration
  def change
    add_column :categories, :tag, :string
    add_column :topics, :tag, :string
  end
end
