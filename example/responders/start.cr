require "../../src/tele/requests/send_message"

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
        text: "Hello, #{first_name}, my name is #{@name}!",
      )
    end
  end
end
