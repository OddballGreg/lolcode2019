class CreateSolutions < ActiveRecord::Migration[5.2]
  def change
    create_table :solutions do |t|
      t.bigint :score
      t.references :problem_set, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
