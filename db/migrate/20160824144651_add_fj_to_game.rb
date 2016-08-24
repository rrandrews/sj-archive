class AddFjToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :final_clue_id, :integer
    add_index :games, :final_clue_id
  end
end
