require "../../src/tele/requests/send_voice"

module Handlers
  class VoiceURL < Tele::Handlers::Message
    EXAMPLE_VOICE_URL = "https://upload.wikimedia.org/wikipedia/en/4/45/ACDC_-_Back_In_Black-sample.ogg"

    def call
      R::SendVoice.new(
        chat_id: message.chat.id,
        voice: EXAMPLE_VOICE_URL,
      )
    end
  end
end
