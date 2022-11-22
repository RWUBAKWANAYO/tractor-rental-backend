class CreateRents < ActiveRecord::Migration[7.0]
  def change
    create_table :rents do |t|
      t.references :user, null: false, foreign_key: true, on_delete: :cascade
      t.references :tractor, null: false, foreign_key: true, on_delete: :cascade
      t.integer :total_costs
      t.boolean :new_farm
      t.string :farm_size
      t.date :rent_date

      t.timestamps
    end
  end
end
