class RemoveCalculationIdFromMechanicalProp < ActiveRecord::Migration[5.1]
  def change
    remove_column :mechanical_props, :calculation_id, :index
  end
end
