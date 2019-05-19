class RemoveUtFromMechanicalProp < ActiveRecord::Migration[5.1]
  def change
    remove_column :mechanical_props, :ut, :string
  end
end
