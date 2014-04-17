class AddPublishedAtOnBook < ActiveRecord::Migration
  def change
    add_column :books, :published_at, :datetime
  end
end
