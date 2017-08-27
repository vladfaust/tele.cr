require "../request"

module Tele
  module Requests
    class UnbanChatMember < Request(Nil)
      map({
        chat_id: {type: Int32 | String},
        user_id: {type: Int32},
      })
    end
  end
end
