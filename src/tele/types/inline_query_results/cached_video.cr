require "../inline_query_result"

module Tele
  module Types
    module InlineQueryResults
      struct CachedVideo < InlineQueryResult
        mapping({
          id:                    {type: String},
          video_file_id:         {type: String},
          title:                 {type: String},
          caption:               {type: String?},
          description:           {type: String?},
          reply_markup:          {type: InlineKeyboardMarkup?},
          input_message_content: {type: InputMessageContent?},
          type:                  {type: String, default: "video"},
        })
      end
    end
  end
end
