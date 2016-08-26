class AddAttachmentsToClue < ActiveRecord::Migration[5.0]
  def change
    add_column :clues, :attachment, :string
  end
end
