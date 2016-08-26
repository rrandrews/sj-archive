class AddImageToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :clues, :image_url, :string
  end
end
