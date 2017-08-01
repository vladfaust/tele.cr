require "json"
require "../type"
require "./keyboard_button"

module Tele
  module Types
    class ReplyKeyboardMarkup < Type
      JSON.mapping({
        keyboard:          Array(Array(KeyboardButton)),
        resize_keyboard:   {type: Bool?},
        one_time_keyboard: {type: Bool?},
        selective:         {type: Bool?},
      })

      def initialize(@keyboard, @resize_keyboard, @one_time_keyboard, @selective)
      end
    end
  end
end
