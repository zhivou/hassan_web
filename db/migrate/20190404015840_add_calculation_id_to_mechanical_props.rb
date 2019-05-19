class AddCalculationIdToMechanicalProps < ActiveRecord::Migration[5.1]
  def change
    add_column :mechanical_props, :calculation_id, :intiger
  end
end
