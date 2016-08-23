class CreateClues < ActiveRecord::Migration[5.0]
  def change
    create_table :clues do |t|
      t.references :column, foreign_key: true
      t.integer :position
      t.string :clue
      t.string :response
      t.references :category, foreign_key: true
      t.boolean :is_dd

      t.timestamps
    end
  end
end
