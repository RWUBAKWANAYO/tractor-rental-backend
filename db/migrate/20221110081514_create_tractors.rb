class CreateTractors < ActiveRecord::Migration[7.0]
  def change
    create_table :tractors do |t|
      t.string :photo
      t.string :title
      t.string :description
      t.integer :price
      t.integer :completion
      t.integer :demand, :default => 0

      t.timestamps
    end
  end
end
