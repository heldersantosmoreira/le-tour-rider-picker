class UpdateLockedAtColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :stages, :locked_at, 'timestamp without time zone USING CAST(locked_at AS timestamp without time zone)'
  end
end
