class AddHardnessHvToMechanicalProps < ActiveRecord::Migration[5.1]
  def change
    add_column :mechanical_props, :hardness_hv, :float
    add_column :mechanical_props, :proof_yield_stress, :float
    add_column :mechanical_props, :tensile_stress, :float
  end
end
