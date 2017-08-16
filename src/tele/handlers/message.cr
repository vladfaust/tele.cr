require "../handler"
require "../types/message"
require "../requests/send_message"

module Tele
  module Handlers
    # Example:
    #
    # ```
    # class MyHandler < Tele::Handlers::Message
    #   def call
    #     send_message("Hello, #{message.from.not_nil!.first_name}!")
    #   end
    # end
    # ```
    abstract class Message < Handler
      UPDATE_TYPES = %w(message edited_message channel_post edited_channel_post)

      protected def message : Types::Message
        ({{ UPDATE_TYPES.map { |u| "update.#{u.id}" }.join(" || ").id }}).not_nil!
      end

      protected def send_message(**args)
        R::SendMessage.new(message.chat.id, **args)
      end
    end
  end
end
