require "../types/inline_keyboard_button"
require "../types/inline_keyboard_markup"

module Tele
  module Keyboards
    class Inline
      class Button
        def initialize(@text : String, @url : String? = nil, @callback_data : String? = nil, @switch_inline_query : String? = nil)
        end

        def to_type
          Types::InlineKeyboardButton.new(@text, @url, @callback_data, @switch_inline_query)
        end
      end

      property buttons = Array(Button | Array(Button)).new

      def initialize(buttons)
        @buttons.push(buttons)
      end

      def to_type
        buttons = @buttons.map { |b| b.is_a?(Button) ? b.to_type : b.map &.to_type }
        Types::InlineKeyboardMarkup.new(buttons)
      end
    end
  end
end
