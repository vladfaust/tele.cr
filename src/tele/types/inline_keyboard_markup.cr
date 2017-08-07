require "../type"
require "./macros"
require "./inline_keyboard_button"

module Tele
  module Types
    class InlineKeyboardMarkup < Type
      mapping({
        inline_keyboard: {type: Array(Array(InlineKeyboardButton) | InlineKeyboardButton)},
      })
    end
  end
end
