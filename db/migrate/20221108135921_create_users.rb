class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :role, :default => rand(852864...952863)
      t.string :photo
      t.timestamps
    end
  end
end
