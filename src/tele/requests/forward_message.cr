require "../request"

module Tele
  module Requests
    class ForwardMessage < Request(Types::Message)
      map({
        chat_id:              {type: Int32 | String},
        from_chat_id:         {type: Int32 | String},
        message_id:           {type: Int32},
        disable_notification: {type: Bool?},
      })
    end
  end
end
