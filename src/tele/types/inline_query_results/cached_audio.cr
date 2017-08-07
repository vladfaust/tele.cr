require "../inline_query_result"

module Tele
  module Types
    module InlineQueryResults
      class CachedAudio < InlineQueryResult
        MAPPING = {
          id:                    {type: String},
          audio_file_id:         {type: String},
          reply_markup:          {type: InlineKeyboardMarkup?},
          input_message_content: {type: InputMessageContent?},
          type:                  {type: String, default: "audio"},
        }

        JSON.mapping({{MAPPING}})
        define_initializer({{MAPPING}})
      end
    end
  end
end
