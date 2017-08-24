require "../type"
require "./macros"
require "./keyboard_button"

module Tele
  module Types
    struct ReplyKeyboardMarkup < Type
      mapping({
        keyboard:          {type: Array(Array(KeyboardButton) | KeyboardButton)},
        resize_keyboard:   {type: Bool?},
        one_time_keyboard: {type: Bool?},
        selective:         {type: Bool?},
      })
    end
  end
end
