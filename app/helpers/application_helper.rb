module ApplicationHelper

      def clue_value(clue)
        if clue.is_fj
          return "Final"
        else
          value = clue.position * 250 * clue.column.board.round
          value = value.to_s + " DD" if clue.is_dd
          value
        end
      end
end
