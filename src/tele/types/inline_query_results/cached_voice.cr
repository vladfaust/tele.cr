require "../inline_query_result"

module Tele
  module Types
    module InlineQueryResults
      class CachedVoice < InlineQueryResult
        MAPPING = {
          id:                    {type: String},
          voice_file_id:         {type: String},
          title:                 {type: String},
          reply_markup:          {type: InlineKeyboardMarkup?},
          input_message_content: {type: InputMessageContent?},
          type:                  {type: String, default: "voice"},
        }

        JSON.mapping({{MAPPING}})
        define_initializer({{MAPPING}})
      end
    end
  end
end
