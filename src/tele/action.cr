module Tele
  # Usage (for `MyResponder` implementation see `Tele::Responder`):
  #
  # ```
  # class MyAction < Tele::Action
  #   def perform
  #     @foo = "bar"
  #     MyResponder.new(update, foo: @foo).respond
  #   end
  # end
  #
  # action = MyAction.new(update)
  # response = a.perform
  # response.try &.to_json # => "{\"method\": \"sendMessage\", \"chat_id\": 42, \"text\": \"foo = bar\"}"
  # ```
  abstract class Action
    private getter update

    def initialize(@update : Types::Update)
    end

    abstract def perform
  end
end
