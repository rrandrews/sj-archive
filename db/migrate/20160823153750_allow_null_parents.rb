class AllowNullParents < ActiveRecord::Migration[5.0]
  def change
    change_column_null :clues, :column_id, true
    change_column_null :columns, :board_id, true
    change_column_null :boards, :game_id, true
  end
end
