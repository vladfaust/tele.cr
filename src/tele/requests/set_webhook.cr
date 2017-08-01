require "../request"

module Tele
  module Requests
    class SetWebhook < Request(Nil)
      map({
        url:             {type: String},
        max_connections: {type: Int32, default: 40},
        allowed_updates: {type: Array(String)?},
      })
    end
  end
end
