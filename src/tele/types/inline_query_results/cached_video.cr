require "../inline_query_result"

module Tele
  module Types
    module InlineQueryResults
      class CachedVideo < InlineQueryResult
        MAPPING = {
          id:                    {type: String},
          video_file_id:         {type: String},
          title:                 {type: String},
          caption:               {type: String?},
          description:           {type: String?},
          reply_markup:          {type: InlineKeyboardMarkup?},
          input_message_content: {type: InputMessageContent?},
          type:                  {type: String, default: "video"},
        }

        JSON.mapping({{MAPPING}})
        define_initializer({{MAPPING}})
      end
    end
  end
end
