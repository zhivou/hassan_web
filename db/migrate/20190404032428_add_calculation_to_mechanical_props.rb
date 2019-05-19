class AddCalculationToMechanicalProps < ActiveRecord::Migration[5.1]
  def change
    add_reference :mechanical_props, :calculation, foreign_key: true
  end
end
