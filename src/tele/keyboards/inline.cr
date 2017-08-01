module Tele
  module Keyboards
    abstract class Inline
      class Button
        property text : String, url : String?, callback_data : String?, switch_inline_query : String?

        def initialize(@text, @url, @callback_data, @switch_inline_query)
        end

        def to_type
          Types::InlineKeyboardButton.new(b.text, b.url, b.callback_data, b.switch_inline_query)
        end
      end

      @buttons = Array(Array(Button)).new

      def to_json
        buttons = @buttons.map { |b| b.is_a?(Button) ? b.to_type : b.map &.to_type }
        Types::InlineKeyboardMarkup.new(buttons).to_json
      end
    end
  end
end
