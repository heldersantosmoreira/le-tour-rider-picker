class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :token
      t.string :name
    end

    add_index :users, :token, unique: true
  end
end
