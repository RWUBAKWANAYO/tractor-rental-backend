class CreateRents < ActiveRecord::Migration[7.0]
  def change
    create_table :rents do |t|
      t.integer :total_costs

      t.timestamps
    end
  end
end
