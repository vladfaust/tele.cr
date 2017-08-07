require "../inline_query_result"

module Tele
  module Types
    module InlineQueryResults
      class Article < InlineQueryResult
        MAPPING = {
          id:                    {type: String},
          title:                 {type: String},
          input_message_content: {type: InputMessageContent},
          reply_markup:          {type: InlineKeyboardMarkup?},
          url:                   {type: String?},
          hide_url:              {type: Bool?},
          description:           {type: String?},
          thumb_url:             {type: String?},
          thumb_width:           {type: Int32?},
          thumb_height:          {type: Int32?},
          type:                  {type: String, default: "article"},
        }

        JSON.mapping({{MAPPING}})
        define_initializer({{MAPPING}})
      end
    end
  end
end
