class ChangeColumn < ActiveRecord::Migration[5.1]
  def change
    change_table :mechanical_props do |t|
      t.change :structure, :integer
    end
  end
end
