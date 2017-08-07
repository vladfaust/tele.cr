require "../inline_query_result"

module Tele
  module Types
    module InlineQueryResults
      class Audio < InlineQueryResult
        mapping({
          id:                    {type: String},
          audio_url:             {type: String},
          title:                 {type: String},
          performer:             {type: String?},
          audio_duration:        {type: Int32?},
          reply_markup:          {type: InlineKeyboardMarkup?},
          input_message_content: {type: InputMessageContent?},
          type:                  {type: String, default: "audio"},
        })
      end
    end
  end
end
