class CreatePicks < ActiveRecord::Migration[6.0]
  def change
    create_table :picks do |t|
      t.references :user
      t.string :rider_name
      t.integer :stage
      t.datetime :created_at, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :updated_at, default: -> { 'CURRENT_TIMESTAMP' }
      t.boolean :visible, default: false
    end

    add_index :picks, %i[user_id rider_name stage], unique: true
  end
end
