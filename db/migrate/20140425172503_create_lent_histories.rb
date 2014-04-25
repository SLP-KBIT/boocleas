class CreateLentHistories < ActiveRecord::Migration
  def change
    create_table :lent_histories do |t|
      t.references :biblio, index: true
      t.references :user, index: true
      t.timestamp :wil_return_at
      t.integer :state

      t.timestamps
    end
  end
end
