class CreateStages < ActiveRecord::Migration[6.0]
  def change
    create_table :stages do |t|
      t.string :number
      t.datetime :date
      t.string :locked_at
      t.datetime :created_at
    end

    add_index :stages, :number, unique: true
  end
end
