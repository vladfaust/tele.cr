require "json"
require "../type"
require "./inline_keyboard_button"

module Tele
  module Types
    class InlineKeyboardMarkup < Type
      JSON.mapping({
        inline_keyboard: Array(Array(InlineKeyboardButton)),
      })

      def initialize(@inline_keyboard)
      end
    end
  end
end
