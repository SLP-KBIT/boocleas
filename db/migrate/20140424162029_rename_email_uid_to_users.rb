class RenameEmailUidToUsers < ActiveRecord::Migration
  def change
    rename_column :users, :email, :uid
  end
end
