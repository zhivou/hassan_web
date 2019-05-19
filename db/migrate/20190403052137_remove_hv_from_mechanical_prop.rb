class RemoveHvFromMechanicalProp < ActiveRecord::Migration[5.1]
  def change
    remove_column :mechanical_props, :hv, :string
  end
end
