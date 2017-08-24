require "../inline_query_result"

module Tele
  module Types
    module InlineQueryResults
      struct Mpeg4Gif < InlineQueryResult
        mapping({
          id:                    {type: String},
          mpeg4_url:             {type: String},
          mpeg4_width:           {type: Int32?},
          mpeg4_height:          {type: Int32?},
          mpeg4_duration:        {type: Int32?},
          thumb_url:             {type: String},
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
