class RenamePicksUpdatedAt < ActiveRecord::Migration[6.0]
  def change
    rename_column :picks, :updated_at, :rider_updated_at
  end
end
