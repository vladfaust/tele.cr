module Responders
  class DontUnderstand < Tele::Responder
    def respond
      R::SendMessage.new(
        chat_id: update.message.not_nil!.chat.id,
        text: "Sorry, but I don't understand you  ¯\\_(ツ)_/¯",
      )
    end
  end
end
