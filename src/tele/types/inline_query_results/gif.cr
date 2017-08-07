require "../inline_query_result"

module Tele
  module Types
    module InlineQueryResults
      class Gif < InlineQueryResult
        MAPPING = {
          id:                    {type: String},
          gif_url:               {type: String},
          gif_width:             {type: Int32?},
          gif_height:            {type: Int32?},
          gif_duration:          {type: Int32?},
          thumb_url:             {type: String},
          title:                 {type: String?},
          caption:               {type: String?},
          reply_markup:          {type: InlineKeyboardMarkup?},
          input_message_content: {type: InputMessageContent?},
          type:                  {type: String, default: "gif"},
        }

        JSON.mapping({{MAPPING}})
        define_initializer({{MAPPING}})
      end
    end
  end
end