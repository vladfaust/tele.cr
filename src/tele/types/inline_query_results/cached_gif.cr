require "../inline_query_result"

module Tele
  module Types
    module InlineQueryResults
      class CachedGif < InlineQueryResult
        MAPPING = {
          id:                    {type: String},
          gif_file_id:           {type: String},
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
