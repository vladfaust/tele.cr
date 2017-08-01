# require "../keyboards/inline"

module Responders
  class Inline < Tele::Responder
    def respond
      # TODO: Add reply markup
      R::SendMessage.new(
        chat_id: update.message.not_nil!.chat.id,
        text: "This is a message with inline keyboard. Tap the buttons below:",
      )
    end
  end
end
