require "../request"

module Tele
  module Requests
    class ExportChatInviteLink < Request(Nil)
      map({
        chat_id: {type: Int32 | String},
      })
    end
  end
end
