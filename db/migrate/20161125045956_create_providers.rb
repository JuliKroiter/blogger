class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.belongs_to :user
      t.string     :provider
      t.string     :uid
      t.string     :oauth_token
      t.string     :oauth_fb_page

      t.timestamps null: false
    end
  end
end
