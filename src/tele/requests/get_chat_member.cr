require "../request"
require "../types/chat_member"

module Tele
  module Requests
    class GetChatMember < Request(Types::ChatMember)
      map({
        chat_id: {type: Int32 | String},
        user_id: {type: Int32},
      })
    end
  end
end
