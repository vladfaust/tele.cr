require "../keyboards/inline"

module Responders
  class Inline < Tele::Responder
    def respond
      random = rand(100)
      # TODO: Add reply markup
      R::SendMessage.new(
        chat_id: update.message.not_nil!.chat.id,
        text: "This is a message with inline keyboard, *id = #{random}*. Tap the buttons below:",
        reply_markup: Keyboards::Inline.new(random).to_type,
        parse_mode: "Markdown",
      )
    end
  end
end
