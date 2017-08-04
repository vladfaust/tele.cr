module Responders
  class HideMenu < Tele::Responder
    def respond
      R::SendMessage.new(
        chat_id: update.message.not_nil!.chat.id,
        text: "Okay, the menu's been hidden.",
        reply_markup: Tele::Types::ReplyKeyboardRemove.new
      )
    end
  end
end
