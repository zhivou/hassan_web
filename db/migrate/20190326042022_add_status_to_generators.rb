class AddStatusToGenerators < ActiveRecord::Migration[5.1]
  def change
    add_column :generators, :status, :string
  end
end
