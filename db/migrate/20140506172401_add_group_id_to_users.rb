class AddGroupIdToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :group, index: true
  end
end
