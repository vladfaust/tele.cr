require "./request"
require "./types/update"

module Tele
  # Usage:
  #
  # ```
  # class MyResponder < Tele::Responder
  #   def initialize(update, @foo : String)
  #     super(update)
  #   end
  #
  #   def respond
  #     R::SendMessage.new(
  #       chat_id: update.message.not_nil!.chat.id,
  #       text: "Hello, #{first_name}, foo is #{@foo}!",
  #     )
  #   end
  # end
  # ```
  abstract class Responder
    alias R = Tele::Requests
    private getter update

    def initialize(@update : Types::Update)
    end

    abstract def respond : R::Request.class
  end
end
