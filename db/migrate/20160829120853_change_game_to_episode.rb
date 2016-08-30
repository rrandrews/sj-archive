class ChangeGameToEpisode < ActiveRecord::Migration[5.0]
  def change
    rename_table :games, :episodes
  end
end
