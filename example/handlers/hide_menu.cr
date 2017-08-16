require "../../src/tele/types/reply_keyboard_remove"

module Handlers
  class HideMenu < Tele::Handlers::Message
    def call
      send_message(
        text: "Okay, the menu's been hidden.",
        reply_markup: Tele::Types::ReplyKeyboardRemove.new
      )
    end
  end
end
