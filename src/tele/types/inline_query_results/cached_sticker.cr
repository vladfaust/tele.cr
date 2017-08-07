require "../inline_query_result"

module Tele
  module Types
    module InlineQueryResults
      class CachedSticker < InlineQueryResult
        mapping({
          id:                    {type: String},
          sticker_file_id:       {type: String},
          reply_markup:          {type: InlineKeyboardMarkup?},
          input_message_content: {type: InputMessageContent?},
          type:                  {type: String, default: "sticker"},
        })
      end
    end
  end
end
