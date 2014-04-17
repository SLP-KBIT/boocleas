class RenamePublishederToPublisherToBook < ActiveRecord::Migration
  def change
    rename_column :books, :publisheder, :publisher
  end
end
