class CreateShelves < ActiveRecord::Migration
  def change
    create_table :shelves do |t|
      t.text :genre
      t.string :room
      t.text :position

      t.timestamps
    end
  end
end
