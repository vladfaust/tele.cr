require "../inline_query_result"

module Tele
  module Types
    module InlineQueryResults
      class CachedVoice < InlineQueryResult
        mapping({
          id:                    {type: String},
          voice_file_id:         {type: String},
          title:                 {type: String},
          caption:               {type: String?},
          reply_markup:          {type: InlineKeyboardMarkup?},
          input_message_content: {type: InputMessageContent?},
          type:                  {type: String, default: "voice"},
        })
      end
    end
  end
end
