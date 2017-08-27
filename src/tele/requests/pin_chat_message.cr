require "../request"

module Tele
  module Requests
    class PinChatMessage < Request(Nil)
      map({
        chat_id:              {type: Int32 | String},
        message_id:           {type: Int32},
        disable_notification: {type: Bool?},
      })
    end
  end
end
