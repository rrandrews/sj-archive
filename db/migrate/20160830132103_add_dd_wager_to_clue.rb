class AddDdWagerToClue < ActiveRecord::Migration[5.0]
  def change
    add_column :clues, :dd_wager, :integer
  end
end
