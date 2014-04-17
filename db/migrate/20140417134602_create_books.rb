class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :isbn
      t.text :author
      t.integer :published_year
      t.string :publisheder
      t.text :genre
      t.text :keyword

      t.timestamps
    end
  end
end
