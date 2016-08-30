class AddColumnWagerToResponses < ActiveRecord::Migration[5.0]
  def change
    add_column :responses, :wager, :integer
  end
end
