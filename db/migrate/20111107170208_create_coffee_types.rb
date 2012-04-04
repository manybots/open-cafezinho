class CreateCoffeeTypes < ActiveRecord::Migration
  def change
    create_table :coffee_types do |t|
      t.integer :brand_id
      t.string :name
      t.string :icon

      t.timestamps
    end
  end
end
