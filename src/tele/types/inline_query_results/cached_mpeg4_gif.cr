require "../inline_query_result"

module Tele
  module Types
    module InlineQueryResults
      class CachedMpeg4Gif < InlineQueryResult
        MAPPING = {
          id:                    {type: String},
          mpeg4_file_id:         {type: String},
          title:                 {type: String?},
          caption:               {type: String?},
          reply_markup:          {type: InlineKeyboardMarkup?},
          input_message_content: {type: InputMessageContent?},
          type:                  {type: String, default: "mpeg4_gif"},
        }

        JSON.mapping({{MAPPING}})
        define_initializer({{MAPPING}})
      end
    end
  end
end
