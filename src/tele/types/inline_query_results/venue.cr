require "../inline_query_result"

module Tele
  module Types
    module InlineQueryResults
      struct Venue < InlineQueryResult
        mapping({
          id:                    {type: String},
          latitude:              {type: Float64},
          longitude:             {type: Float64},
          title:                 {type: String},
          address:               {type: String},
          foursquare_id:         {type: String?},
          reply_markup:          {type: InlineKeyboardMarkup?},
          input_message_content: {type: InputMessageContent?},
          thumb_url:             {type: String?},
          thumb_width:           {type: Int32?},
          thumb_height:          {type: Int32?},
          type:                  {type: String, default: "venue"},
        })
      end
    end
  end
end
