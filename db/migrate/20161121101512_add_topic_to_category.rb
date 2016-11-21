class AddTopicToCategory < ActiveRecord::Migration
  def change
    add_reference :categories, :topic
  end
end
