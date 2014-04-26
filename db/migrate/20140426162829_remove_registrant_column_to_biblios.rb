class RemoveRegistrantColumnToBiblios < ActiveRecord::Migration
  def change
    remove_column :biblios, :registrant, :string
  end
end
