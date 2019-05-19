class ChangeCarbonToFloatFromMechanicalProps < ActiveRecord::Migration[5.1]
  def change
    change_table :mechanical_props do |t|
      t.change :carbon, :float
    end
  end
end
