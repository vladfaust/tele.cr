require "../request"
require "../types/chat_member"

module Tele
  module Requests
    class GetChatAdministrators < Request(Array(Types::ChatMember))
      map({
        chat_id: {type: Int32 | String},
      })
    end
  end
end
