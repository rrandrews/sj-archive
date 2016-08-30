class ChangeGameidColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :boards, :game_id, :episode_id
  end
end
