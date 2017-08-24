require "../inline_query_result"

module Tele
  module Types
    module InlineQueryResults
      struct Photo < InlineQueryResult
        mapping({
          id:                    {type: String},
          photo_url:             {type: String},
          thumb_url:             {type: String},
          photo_width:           {type: Int32?},
          photo_height:          {type: Int32?},
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
