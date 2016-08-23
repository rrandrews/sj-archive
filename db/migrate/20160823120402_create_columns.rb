class CreateColumns < ActiveRecord::Migration[5.0]
  def change
    create_table :columns do |t|
      t.integer :position
      t.references :board, foreign_key: true

      t.timestamps
    end
  end
end
