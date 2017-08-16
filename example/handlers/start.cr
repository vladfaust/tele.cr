require "../keyboards/main_menu"

module Handlers
  class Start < Tele::Handlers::Message
    NAME = "ExampleBot"

    def call
      send_message(
        text: "Hello, <i>#{message.from.not_nil!.first_name}</i>, my name is <b>#{NAME}</b>!",
        parse_mode: "HTML",
        reply_markup: Keyboards::MainMenu.new.to_type
      )
    end
  end
end
