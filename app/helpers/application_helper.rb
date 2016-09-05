module ApplicationHelper

      def clue_value(clue)
        if clue.is_fj
          "Final"
        else
          value = clue.position * 250 * clue.column.board.round
          value = value.to_s + " DD" if clue.is_dd
          value
        end
      end

      def owner_or_admin(owner)
        current_user == owner || current_user.admin
      end

      def leading_zero(number)
        number = 0 if number.nil?
        number = '0' + number.to_s if number < 10
        number
      end
end
