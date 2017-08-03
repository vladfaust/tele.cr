require "../request"

module Tele
  module Requests
    class AnswerCallbackQuery < Request(Nil)
      map({
        callback_query_id: {type: String},
        text:              {type: String?},
        show_alert:        {type: Bool?},
        url:               {type: String?},
        cache_time:        {type: Int32?},
      })
    end
  end
end
