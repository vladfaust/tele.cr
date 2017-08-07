require "../request"
require "../types/inline_query_result"

module Tele
  module Requests
    class AnswerInlineQuery < Request(Nil)
      map({
        inline_query_id:     {type: String},
        results:             {type: Array(Types::InlineQueryResult)},
        cache_time:          {type: Int32?},
        is_personal:         {type: Bool?},
        next_offset:         {type: String?},
        switch_pm_text:      {type: String?},
        switch_pm_parameter: {type: String?},
      })
    end
  end
end
