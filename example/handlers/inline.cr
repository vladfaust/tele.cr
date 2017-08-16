require "../keyboards/inline"

module Handlers
  class Inline < Tele::Handlers::Message
    def call
      random = rand(100)
      send_message(
        text: "This is a message with inline keyboard, *id = #{random}*. Tap the buttons below:",
        reply_markup: Keyboards::Inline.new(random).to_type,
        parse_mode: "Markdown",
      )
    end
  end
end
