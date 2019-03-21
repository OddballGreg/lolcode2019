class CreateProblemSets < ActiveRecord::Migration[5.2]
  def change
    create_table :problem_sets do |t|
      t.string :name

      t.timestamps
    end
  end
end
