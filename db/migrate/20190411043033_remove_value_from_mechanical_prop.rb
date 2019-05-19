class RemoveValueFromMechanicalProp < ActiveRecord::Migration[5.1]
  def change
    remove_column :mechanical_props, :value, :float
  end
end
