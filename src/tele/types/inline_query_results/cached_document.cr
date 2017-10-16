require "../inline_query_result"

module Tele
  module Types
    module InlineQueryResults
      struct CachedDocument < InlineQueryResult
        mapping({
          id:                    {type: String},
          title:                 {type: String},
          document_file_id:      {type: String},
          description:           {type: String?},
          caption:               {type: String?},
          reply_markup:          {type: InlineKeyboardMarkup?},
          input_message_content: {type: InputMessageContent?},
          type:                  {type: String, default: "document"},
        })
      end
    end
  end
end
