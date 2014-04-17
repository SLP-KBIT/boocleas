class RenamePublishedYearToPublishedAtToBook < ActiveRecord::Migration
  def change
    rename_column :books, :published_year, :published_at
  end
end
