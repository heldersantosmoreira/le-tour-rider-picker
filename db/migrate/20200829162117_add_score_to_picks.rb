class AddScoreToPicks < ActiveRecord::Migration[6.0]
  def change
    add_column :picks, :score, :integer
  end
end
