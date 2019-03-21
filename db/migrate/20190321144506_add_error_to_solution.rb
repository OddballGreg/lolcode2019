class AddErrorToSolution < ActiveRecord::Migration[5.2]
  def change
    add_column :solutions, :error, :string
  end
end
