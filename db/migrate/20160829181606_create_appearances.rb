class CreateAppearances < ActiveRecord::Migration[5.0]
  def change
    create_table :appearances do |t|
      t.references :episode, foreign_key: true
      t.references :contestant, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
