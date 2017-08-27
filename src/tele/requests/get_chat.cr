require "../request"
require "../types/chat"

module Tele
  module Requests
    class GetChat < Request(Types::Chat)
      map({
        chat_id: {type: Int32 | String},
      })
    end
  end
end
