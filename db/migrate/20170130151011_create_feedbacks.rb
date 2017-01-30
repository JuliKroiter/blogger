class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|

      t.timestamps null: false
      t.string :commenter_name
      t.string :short_desc
      t.text :long_desc
      t.string :commenter_picture
    end
  end
end
