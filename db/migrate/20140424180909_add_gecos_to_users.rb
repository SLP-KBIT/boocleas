class AddGecosToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gecos, :text
  end
end
