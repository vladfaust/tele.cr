require "../type"
require "./input_message_content"
require "./inline_keyboard_markup"

module Tele
  module Types
    abstract struct InlineQueryResult < Type
    end
  end
end
