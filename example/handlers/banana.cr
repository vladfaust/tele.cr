module Handlers
  class Banana < Tele::Handlers::Message
    def call
      send_message(
        text: "Here they are: " + ("🍌" * (2 + rand(6))),
        parse_mode: "Markdown",
      )
    end
  end
end
