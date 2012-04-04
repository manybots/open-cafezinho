class AddIconToMachines < ActiveRecord::Migration
  def change
    add_column :machines, :icon, :string
  end
end