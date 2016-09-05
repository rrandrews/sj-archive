class AddPublicToEpisode < ActiveRecord::Migration[5.0]
  def change
    rename_column :episodes, :public, :is_public
  end
end
