class CreateApiUsers < ActiveRecord::Migration
  def change
    create_table :api_users do |t|
      t.string :auth_token
      t.string :api_key
      t.string :ip

      t.timestamps null: false
    end
  end
end