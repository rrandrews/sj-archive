class CreateResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :responses do |t|
      t.references :contestant, foreign_key: true
      t.references :clue, foreign_key: true
      t.string :response
      t.boolean :is_correct

      t.timestamps
    end
  end
end
