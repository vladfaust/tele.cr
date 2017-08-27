require "../request"

module Tele
  module Requests
    class SetChatPhoto < Request(Nil)
      map({
        chat_id: {type: Int32 | String},
        photo:   {type: File},
      })
    end
  end
end
