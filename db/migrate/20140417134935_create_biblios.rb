class CreateBiblios < ActiveRecord::Migration
  def change
    create_table :biblios do |t|
      t.references :book, index: true
      t.references :shelf, index: true
      t.string :registrant

      t.timestamps
    end
  end
end
