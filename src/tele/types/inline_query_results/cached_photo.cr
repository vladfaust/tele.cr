require "../inline_query_result"

module Tele
  module Types
    module InlineQueryResults
      struct CachedPhoto < InlineQueryResult
        mapping({
          id:                    {type: String},
          photo_file_id:         {type: String},
          title:                 {type: String?},
          description:           {type: String?},
          caption:               {type: String?},
          reply_markup:          {type: InlineKeyboardMarkup?},
          input_message_content: {type: InputMessageContent?},
          type:                  {type: String, default: "photo"},
        })
      end
    end
  end
end
