require "../request"

module Tele
  module Requests
    class UnpinChatMessage < Request(Nil)
      map({
        chat_id: {type: Int32 | String},
      })
    end
  end
end
