class CreateMechanicalProps < ActiveRecord::Migration[5.1]
  def change
    create_table :mechanical_props do |t|
      t.decimal :carbon
      t.integer :structure
      t.decimal :hv
      t.decimal :ys
      t.decimal :ut

      t.timestamps
    end
  end
end
