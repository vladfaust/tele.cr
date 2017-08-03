module Responders
  class Banana < Tele::Responder
    def respond
      R::SendMessage.new(
        chat_id: update.message.not_nil!.chat.id,
        text: "Here they are: " + ("🍌" * (2 + rand(6))),
        parse_mode: "Markdown",
      )
    end
  end
end
