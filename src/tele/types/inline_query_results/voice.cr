require "../inline_query_result"

module Tele
  module Types
    module InlineQueryResults
      class Voice < InlineQueryResult
        MAPPING = {
          id:                    {type: String},
          voice_url:             {type: String},
          title:                 {type: String},
          voice_duration:        {type: Int32?},
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
