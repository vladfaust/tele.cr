module Handlers
  class Banana < Tele::Handlers::Message
    def call
      a = [send_message(text: "Are you happy now?")]
      (rand(3) + 1).times { a << send_message(text: "🍌") }
      a
    end
  end
end
