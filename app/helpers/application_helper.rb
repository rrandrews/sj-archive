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

      def bootstrap_class_for flash_type
        { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
      end

      def flash_messages(opts = {})
        flash.each do |msg_type, message|
          concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)}
                              alert-dismissible fixed-width", role: 'alert') do
            concat(content_tag(:button, class: 'close', data: { dismiss: 'alert' }) do
              concat content_tag(:span, '&times;'.html_safe, 'aria-hidden' => true)
              concat content_tag(:span, 'Close', class: 'sr-only')
            end)
            concat message
          end)
        end
        nil
      end
end
