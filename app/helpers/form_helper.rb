module FormHelper
  def setup_column(column)
    column.category ||= Category.new
    5.times { column.clues.build }
    column
  end

  def setup_clue(clue)
    clue.category ||= Category.new
    clue
  end
end
