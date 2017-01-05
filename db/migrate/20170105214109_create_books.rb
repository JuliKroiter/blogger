class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :content
      t.integer :price
      t.string :image
      t.timestamps null: false
    end
  end
end
