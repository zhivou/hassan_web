class CreateGenerators < ActiveRecord::Migration[5.1]
  def change
    create_table :generators do |t|
      t.decimal :a_vol
      t.decimal :b_vol
      t.decimal :c_vol
      t.decimal :d_vol
      t.string :email
      t.string :first_name
      t.string :last_name
      t.text :note

      t.timestamps
    end
  end
end
