require "../types/keyboard_button"
require "../types/reply_keyboard_markup"

module Tele
  module Keyboards
    abstract class Reply
      class Button
        def initialize(@text : String, @request_contact : Bool? = nil, @request_location : Bool? = nil)
        end

        def to_type
          Types::KeyboardButton.new(@text, @request_contact, @request_location)
        end
      end

      @buttons = Array(Button | Array(Button)).new

      # *resize_keyboard* defaults to true because I hate these stupid half-screen sized keyboards!
      def initialize(@resize_keyboard : Bool? = true, @one_time_keyboard : Bool? = nil, @selective : Bool? = nil)
      end

      def to_type
        buttons = @buttons.map { |b| b.is_a?(Button) ? b.to_type : b.map &.to_type }
        Types::ReplyKeyboardMarkup.new(buttons, @resize_keyboard, @one_time_keyboard, @selective)
      end
    end
  end
end
