require "../inline_query_result"

module Tele
  module Types
    module InlineQueryResults
      struct Document < InlineQueryResult
        mapping({
          id:                    {type: String},
          title:                 {type: String},
          document_url:          {type: String},
          mime_type:             {type: String},
          caption:               {type: String?},
          description:           {type: String?},
          reply_markup:          {type: InlineKeyboardMarkup?},
          input_message_content: {type: InputMessageContent?},
          thumb_url:             {type: String?},
          thumb_width:           {type: Int32?},
          thumb_height:          {type: Int32?},
          type:                  {type: String, default: "document"},
        })
      end
    end
  end
end
