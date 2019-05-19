class AddValueToMechanicalProps < ActiveRecord::Migration[5.1]
  def change
    add_column :mechanical_props, :value, :decimal
  end
end
