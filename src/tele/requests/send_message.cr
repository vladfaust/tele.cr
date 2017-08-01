require "../request"

module Tele
  module Requests
    class SendMessage < Request(Types::Message)
      map({
        chat_id:                  {type: Int32 | String},
        text:                     {type: String},
        parse_mode:               {type: String?},
        disable_web_page_preview: {type: Bool?},
        disable_notification:     {type: Bool?},
        reply_to_message_id:      {type: Int32?},
        reply_markup:             {type: Types::InlineKeyboardMarkup | Types::ReplyKeyboardMarkup | Types::ReplyKeyboardRemove | Types::ForceReply, nilable: true},
      })
    end
  end
end
