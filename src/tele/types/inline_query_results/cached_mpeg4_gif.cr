require "../inline_query_result"

module Tele
  module Types
    module InlineQueryResults
      struct CachedMpeg4Gif < InlineQueryResult
        mapping({
          id:                    {type: String},
          mpeg4_file_id:         {type: String},
          title:                 {type: String?},
          caption:               {type: String?},
          reply_markup:          {type: InlineKeyboardMarkup?},
          input_message_content: {type: InputMessageContent?},
          type:                  {type: String, default: "mpeg4_gif"},
        })
      end
    end
  end
end
