class RenameErrataToNote < ActiveRecord::Migration[5.0]
  def change
    rename_column :clues, :errata, :note
  end
end
