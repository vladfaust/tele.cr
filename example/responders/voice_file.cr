require "../../src/tele/requests/send_voice"
require "../keyboards/like"

module Responders
  # This Responder sends example Voice from local File
  # Sound source: https://en.wikipedia.org/wiki/File:ACDC_-_Back_In_Black-sample.ogg
  class VoiceFile < Tele::Responder
    def respond
      file = File.open(Dir.current + "/example/files/ACDC_-_Back_In_Black-sample.ogg")
      R::SendVoice.new(
        chat_id: update.message.not_nil!.chat.id,
        voice: file,
        reply_markup: Keyboards::Like.new.to_type,
      )
    end
  end
end
