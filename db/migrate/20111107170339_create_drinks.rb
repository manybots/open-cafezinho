class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.integer :machine_id
      t.integer :coffee_type_id
      t.integer :user_id

      t.timestamps
    end
  end
end
