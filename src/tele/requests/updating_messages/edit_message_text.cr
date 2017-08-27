require "../../request"
require "../../types/message"
require "../../types/inline_keyboard_markup"

module Tele
  module Requests
    module UpdatingMessages
      class EditMessageText < Request(Types::Message) # TODO: "the edited Message is returned, otherwise True is returned."
        map({
          text:                     {type: String},
          chat_id:                  {type: Int32 | String | Nil},
          message_id:               {type: Int32?},
          inline_message_id:        {type: String?},
          parse_mode:               {type: String?},
          disable_web_page_preview: {type: Bool?},
          disable_notification:     {type: Bool?},
          reply_markup:             {type: Types::InlineKeyboardMarkup?},
        })
      end
    end
  end
end
