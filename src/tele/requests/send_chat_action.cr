require "../request"

module Tele
  module Requests
    class SendChatAction < Request(Nil)
      map({
        chat_id: {type: Int32 | String},
        action:  {type: String},
      })
    end
  end
end
