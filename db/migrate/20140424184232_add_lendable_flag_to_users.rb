class AddLendableFlagToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_lendable, :boolean
  end
end
