class AddNoteToContestants < ActiveRecord::Migration[5.0]
  def change
    add_column :contestants, :note, :string
  end
end
