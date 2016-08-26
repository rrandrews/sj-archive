class AddFjToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :final_id, :integer
    add_index :games, :final_id
    add_foreign_key :games, :clues, column: :final_id
    add_column :clues, :is_fj, :boolean
  end
end
