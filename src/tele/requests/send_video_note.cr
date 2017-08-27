require "../request"
require "../types/message"
require "../types/inline_keyboard_markup"
require "../types/reply_keyboard_markup"
require "../types/reply_keyboard_remove"
require "../types/force_reply"

module Tele
  module Requests
    class SendVideoNote < Request(Types::Message)
      map({
        chat_id: {type: Int32 | String},
        # Note that "Sending video notes by a URL is currently unsupported" @ https://core.telegram.org/bots/api#sendvideonote
        video_note:           {type: File | String},
        duration:             {type: Int32?},
        length:               {type: Int32?},
        disable_notification: {type: Bool?},
        reply_to_message_id:  {type: Int32?},
        reply_markup:         {type: Types::InlineKeyboardMarkup | Types::ReplyKeyboardMarkup | Types::ReplyKeyboardRemove | Types::ForceReply, nilable: true},
      })
    end
  end
end
