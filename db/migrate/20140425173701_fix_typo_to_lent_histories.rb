class FixTypoToLentHistories < ActiveRecord::Migration
  def change
    rename_column :lent_histories, :wil_return_at, :will_return_at
  end
end
