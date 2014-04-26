class AddRegistrantReferencesToBiblio < ActiveRecord::Migration
  def change
    add_column :biblios, :registrant_id, :integer
  end
end
