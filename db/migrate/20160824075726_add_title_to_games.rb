class AddTitleToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :title, :string
  end
end
