class RenameClueResponseCorrectResponse < ActiveRecord::Migration[5.0]
  def change
    rename_column :clues, :response, :correct_response
    add_column :clues, :errata, :string
    add_column :clues, :pick_order, :integer
  end
end
