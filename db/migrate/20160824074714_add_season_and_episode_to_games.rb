class AddSeasonAndEpisodeToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :season, :integer
    add_column :games, :episode, :integer
  end
end
