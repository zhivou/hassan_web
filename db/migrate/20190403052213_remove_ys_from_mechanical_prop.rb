class RemoveYsFromMechanicalProp < ActiveRecord::Migration[5.1]
  def change
    remove_column :mechanical_props, :ys, :string
  end
end
