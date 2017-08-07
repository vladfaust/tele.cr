require "../inline_query_result"

module Tele
  module Types
    module InlineQueryResults
      class Contact < InlineQueryResult
        MAPPING = {
          id:                    {type: String},
          phone_number:          {type: String},
          first_name:            {type: String},
          last_name:             {type: String?},
          user_id:               {type: Int32?},
          reply_markup:          {type: InlineKeyboardMarkup?},
          input_message_content: {type: InputMessageContent?},
          thumb_url:             {type: String?},
          thumb_width:           {type: Int32?},
          thumb_height:          {type: Int32?},
          type:                  {type: String, default: "contact"},
        }

        JSON.mapping({{MAPPING}})
        define_initializer({{MAPPING}})
      end
    end
  end
end
