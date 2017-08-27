require "../request"
require "../types/message"
require "../types/inline_keyboard_markup"
require "../types/reply_keyboard_markup"
require "../types/reply_keyboard_remove"
require "../types/force_reply"

module Tele
  module Requests
    class SendVideo < Request(Types::Message)
      map({
        chat_id:              {type: Int32 | String},
        video:                {type: File | String},
        duration:             {type: Int32?},
        width:                {type: Int32?},
        height:               {type: Int32?},
        caption:              {type: String?},
        disable_notification: {type: Bool?},
        reply_to_message_id:  {type: Int32?},
        reply_markup:         {type: Types::InlineKeyboardMarkup | Types::ReplyKeyboardMarkup | Types::ReplyKeyboardRemove | Types::ForceReply, nilable: true},
      })
    end
  end
end
