class CreateMachines < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.string :name
      t.string :description
      t.string :slug
      t.integer :brand_id
      t.integer :user_id
      t.boolean :is_public
      t.boolean :is_codebits

      t.timestamps
    end
    add_index :machines, :slug, :unique => true
  end
end
