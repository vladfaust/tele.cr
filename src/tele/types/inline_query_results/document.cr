require "../inline_query_result"

module Tele
  module Types
    module InlineQueryResults
      class Document < InlineQueryResult
        MAPPING = {
          id:                    {type: String},
          title:                 {type: String},
          caption:               {type: String?},
          document_url:          {type: String},
          mime_type:             {type: String},
          description:           {type: String?},
          reply_markup:          {type: InlineKeyboardMarkup?},
          input_message_content: {type: InputMessageContent?},
          thumb_url:             {type: String?},
          thumb_width:           {type: Int32?},
          thumb_height:          {type: Int32?},
          type:                  {type: String, default: "document"},
        }

        JSON.mapping({{MAPPING}})
        define_initializer({{MAPPING}})
      end
    end
  end
end
