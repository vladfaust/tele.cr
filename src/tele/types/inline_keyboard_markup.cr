require "json"
require "../type"
require "./macros"
require "./inline_keyboard_button"

module Tele
  module Types
    class InlineKeyboardMarkup < Type
      include Macros

      MAPPING = {
        inline_keyboard: {type: Array(Array(InlineKeyboardButton))},
      }

      define_initializer({{MAPPING}})
      JSON.mapping({{MAPPING}})
    end
  end
end
