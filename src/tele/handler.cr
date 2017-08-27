require "./request"
require "./types/update"

module Tele
  abstract class Handler
    alias R = Tele::Requests
    private getter update

    def self.call(update)
      self.new(update).call
    end

    protected def initialize(@update : Types::Update)
    end

    # Handles an update and returns a single or multiple (as Array) instances of Requests (alias R), which we'll call *responses* here.
    #
    # The first *response* is rendered as a webhook answer, others are sent via Client. Note that at the moment the webhook answer is delayed unless all Client requests are executed.
    #
    # When there are no any *responses* after handling, the bot returns 200 OK (safely ignores).
    #
    # Examples:
    # ```
    # class MyHandler < Tele::Handler
    #   def call
    #     R::SendMessage.new(
    #       chat_id: update.message.not_nil!.chat.id,
    #       text: "Hello, #{update.message.not_nil!.from.not_nil!.first_name}!",
    #     )
    #     # OR
    #     [
    #       R::SendMessage.new(
    #         chat_id: update.message.not_nil!.chat.id,
    #         text: "Message 1, answered with webhook right after Message 2 is delivered",
    #       ),
    #       R::SendMessage.new(
    #         chat_id: update.message.not_nil!.chat.id,
    #         text: "Message 2, sent via Client",
    #       ),
    #     ]
    #     # OR
    #     nil
    #   end
    # end
    #
    # MyHandler.call(update)
    # ```
    abstract def call : Array(Request.class) | Request.class | Nil
  end
end
