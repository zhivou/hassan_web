class ChangeValueToFloatFromMechanicalProps < ActiveRecord::Migration[5.1]
  def change
    change_table :mechanical_props do |t|
      t.change :value, :float
    end
  end
end
