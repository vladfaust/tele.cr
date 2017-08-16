require "./request"
require "./types/update"

module Tele
  # Usage:
  #
  # ```
  # class MyHandler < Tele::Handler
  #   def call
  #     R::SendMessage.new(
  #       chat_id: update.message.not_nil!.chat.id,
  #       text: "Hello, #{update.message.not_nil!.from.not_nil!.first_name}!",
  #     )
  #   end
  # end
  # ```
  abstract class Handler
    alias R = Tele::Requests
    private getter update

    def self.call(update)
      self.new(update).call
    end

    protected def initialize(@update : Types::Update)
    end

    abstract def call : R::Request.class | Nil
  end
end
