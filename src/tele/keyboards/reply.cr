module Tele
  module Keyboards
    abstract class Reply
      class Button
        property text : String, request_contact : Bool?, request_location : Bool?

        def initialize(@text, @request_contact, @request_location)
        end

        def to_type
          Types::KeyboardButton.new(b.text, b.request_contact, b.request_location)
        end
      end

      @buttons = Array(Array(Button)).new

      # *resize_keyboard* defaults to true because I hate these stupid half-screen sized keyboards!
      def initialize(@one_time_keyboard : Bool?, @selective : Bool?, @resize_keyboard : Bool? = true)
      end

      def to_json
        buttons = @buttons.map { |b| b.is_a?(Button) ? b.to_type : b.map &.to_type }
        Types::ReplyKeyboardMarkup.new(buttons, @resize_keyboard, @one_time_keyboard, @selective).to_json
      end
    end
  end
end
