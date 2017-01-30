class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.string :picture
      t.text :description
      t.string :fb_link
      t.timestamps null: false
    end
  end
end
