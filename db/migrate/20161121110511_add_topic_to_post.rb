class AddTopicToPost < ActiveRecord::Migration
  def change
    add_reference :posts, :topic
  end
end
