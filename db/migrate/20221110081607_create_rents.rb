class CreateRents < ActiveRecord::Migration[7.0]
  def change
    create_table :rents do |t|
      t.references :user, null: false, foreign_key: true
      t.references :tractor, null: false, foreign_key: true
      t.integer :total_costs
      t.date :rent_date

      t.timestamps
    end
  end
end
