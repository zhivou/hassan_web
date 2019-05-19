class RemoveCalculationIdFromMechanicalProps < ActiveRecord::Migration[5.1]
  def change
    remove_column :mechanical_props, :calculation_id, :intiger
  end
end
