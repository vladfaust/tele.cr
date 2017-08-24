require "../inline_query_result"

module Tele
  module Types
    module InlineQueryResults
      struct CachedAudio < InlineQueryResult
        mapping({
          id:                    {type: String},
          audio_file_id:         {type: String},
          reply_markup:          {type: InlineKeyboardMarkup?},
          input_message_content: {type: InputMessageContent?},
          type:                  {type: String, default: "audio"},
        })
      end
    end
  end
end
