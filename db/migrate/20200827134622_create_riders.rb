class CreateRiders < ActiveRecord::Migration[6.0]
  def change
    create_table :riders do |t|
      t.string :name
    end

    add_index :riders, :name, unique: true
    change_column :picks, :rider_name, :integer, using: 'NULL'
    rename_column :picks, :rider_name, :rider_id
    add_foreign_key :picks, :riders
  end
end
