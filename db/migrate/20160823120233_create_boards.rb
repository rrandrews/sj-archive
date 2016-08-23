class CreateBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :boards do |t|
      t.integer :round
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
