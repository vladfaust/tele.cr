require "../inline_query_result"

module Tele
  module Types
    module InlineQueryResults
      class Video < InlineQueryResult
        MAPPING = {
          id:                    {type: String},
          video_url:             {type: String},
          mime_type:             {type: String},
          thumb_url:             {type: String},
          title:                 {type: String},
          caption:               {type: String?},
          video_width:           {type: Int32?},
          video_height:          {type: Int32?},
          video_duration:        {type: Int32?},
          description:           {type: String?},
          reply_markup:          {type: InlineKeyboardMarkup?},
          input_message_content: {type: InputMessageContent?},
          type:                  {type: String, default: "video"},
        }

        JSON.mapping({{MAPPING}})
        define_initializer({{MAPPING}})
      end
    end
  end
end
