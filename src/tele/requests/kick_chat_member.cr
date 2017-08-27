require "../request"

module Tele
  module Requests
    class KickChatMember < Request(Nil)
      map({
        chat_id:    {type: Int32 | String},
        user_id:    {type: Int32},
        until_date: {type: Int32?},
      })
    end
  end
end
