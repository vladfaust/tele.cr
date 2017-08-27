require "../../request"
require "../../types/message"
require "../../types/inline_keyboard_markup"

module Tele
  module Requests
    module UpdatingMessages
      class EditMessageCaption < Request(Types::Message) # TODO: "the edited Message is returned, otherwise True is returned."
        map({
          chat_id:           {type: Int32 | String | Nil},
          message_id:        {type: Int32?},
          inline_message_id: {type: String?},
          caption:           {type: String?},
          reply_markup:      {type: Types::InlineKeyboardMarkup?},
        })
      end
    end
  end
end
