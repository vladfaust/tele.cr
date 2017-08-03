require "../../src/tele/requests/send_message"
require "../keyboards/main_menu"

module Responders
  class Start < Tele::Responder
    # FIXME: Remove default *name* value
    def initialize(update, @name : String? = nil)
      super(update)
    end

    def respond
      first_name = update.message.not_nil!.chat.first_name

      # TODO: Add reply markup
      R::SendMessage.new(
        chat_id: update.message.not_nil!.chat.id,
        text: "Hello, <i>#{first_name}</i>, my name is <b>#{@name}</b>!",
        parse_mode: "HTML",
        reply_markup: Keyboards::MainMenu.new.to_type
      )
    end
  end
end
