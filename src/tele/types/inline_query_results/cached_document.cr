require "../inline_query_result"

module Teleg
  module Types
    module InlineQueryResults
      class CachedDocument < InlineQueryResult
        MAPPING = {
          id:                    {type: String},
          title:                 {type: String},
          document_file_id:      {type: String},
          description:           {type: String?},
          caption:               {type: String?},
          reply_markup:          {type: InlineKeyboardMarkup?},
          input_message_content: {type: InputMessageContent?},
          type:                  {type: String, default: "document"},
        }

        JSON.mapping({{MAPPING}})
        define_initializer({{MAPPING}})
      end
    end
  end
end
