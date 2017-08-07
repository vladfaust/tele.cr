require "json"
require "../type"
require "./macros"
require "./keyboard_button"

module Tele
  module Types
    class ReplyKeyboardMarkup < Type
      MAPPING = {
        keyboard:          {type: Array(Array(KeyboardButton) | KeyboardButton)},
        resize_keyboard:   {type: Bool?},
        one_time_keyboard: {type: Bool?},
        selective:         {type: Bool?},
      }

      define_initializer({{MAPPING}})
      JSON.mapping({{MAPPING}})
    end
  end
end
