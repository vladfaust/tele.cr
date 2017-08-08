require "../../src/tele/requests/send_voice"

module Responders
  class VoiceURL < Tele::Responder
    EXAMPLE_VOICE_URL = "https://upload.wikimedia.org/wikipedia/en/4/45/ACDC_-_Back_In_Black-sample.ogg"

    def respond
      R::SendVoice.new(
        chat_id: update.message.not_nil!.chat.id,
        voice: EXAMPLE_VOICE_URL,
      )
    end
  end
end
