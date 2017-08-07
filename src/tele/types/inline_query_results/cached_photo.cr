require "../inline_query_result"

module Tele
  module Types
    module InlineQueryResults
      class CachedPhoto < InlineQueryResult
        MAPPING = {
          id:                    {type: String},
          photo_file_id:         {type: String},
          title:                 {type: String?},
          description:           {type: String?},
          caption:               {type: String?},
          reply_markup:          {type: InlineKeyboardMarkup?},
          input_message_content: {type: InputMessageContent?},
          type:                  {type: String, default: "photo"},
        }

        JSON.mapping({{MAPPING}})
        define_initializer({{MAPPING}})
      end
    end
  end
end
