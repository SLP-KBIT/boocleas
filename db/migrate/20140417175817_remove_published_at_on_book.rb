class RemovePublishedAtOnBook < ActiveRecord::Migration
  def change
    remove_column :books, :published_at
  end
end
