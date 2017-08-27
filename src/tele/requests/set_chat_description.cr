require "../request"

module Tele
  module Requests
    class SetChatDescription < Request(Nil)
      map({
        chat_id:     {type: Int32 | String},
        description: {type: String?},
      })
    end
  end
end
