require "../request"

module Tele
  module Requests
    class SetChatTitle < Request(Nil)
      map({
        chat_id: {type: Int32 | String},
        title:   {type: String},
      })
    end
  end
end
