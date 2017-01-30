class AddLinkToBooks < ActiveRecord::Migration
  def change
    add_column :books, :buy_ua_link, :string
    add_column :books, :buy_ozon_link, :string
    add_column :books, :buy_labirint_link, :string
    add_column :books, :buy_e_link, :string
    add_column :books, :buy_bel_link, :string
  end
end
